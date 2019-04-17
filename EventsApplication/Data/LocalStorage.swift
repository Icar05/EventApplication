//
//  LocalStorage.swift
//  EventsApplication
//
//  Created by Eddson on 4/17/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import RxSwift


class LocalStorage {
    
    
    let articleTableName = "Article"
    let articleTitle = "title"
    let articleDescription = "desc"
    let articleDate = "date"
    let articleAutor = "autor"
    let articleImageUrl = "imgUrl"
    let articleUrl = "url"
    
    
    let sourcesTableName = "SourcesNews"
    let sourcesCategory = "category"
    let sourcesCountry = "country"
    let sourcesDescription = "desc"
    let sourcesLanguage = "language"
    let sourcesName = "name"
    let sourcesUrl = "url"
    
    
    let articleSubject: PublishSubject<[Articles]>  =  PublishSubject()
    let sourcesSubject: PublishSubject<[Sources]>  =  PublishSubject()
    let saveDataSubject: PublishSubject<Bool>  =  PublishSubject()
    
   
    
    fileprivate func getManagedContext() -> NSManagedObjectContext?{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext
    }
    
    
    /*
        Read headlines
     */
    func getHeadlines() -> Observable<[Articles]>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
            fetchRequest.predicate = NSPredicate(format: "country = %@", getDefaultCountry())
        
        return getArticles(fetchedRequest: fetchRequest)
    }
    
    func getHeadlines(country: String) -> Observable<[Articles]>{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
            fetchRequest.predicate = NSPredicate(format: "country = %@", country)
        
        return getArticles(fetchedRequest: fetchRequest)
    }
    
    func getHeadlines(category: String) -> Observable<[Articles]> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
            fetchRequest.predicate = NSPredicate(format: "category = %@ AND country = %@", category, getDefaultCountry())
        
        return getArticles(fetchedRequest: fetchRequest)
    }

    
    /*
      Read evertything
    */
    func getEverything(query: String) -> Observable<[Articles]>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
            fetchRequest.predicate = NSPredicate(format: "name contains[c] %@ OR desc contains[c] %@", query, query)
        
        return getArticles(fetchedRequest: fetchRequest)
    }

    func getEverything(query: String, language: String) -> Observable<[Articles]> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
            fetchRequest.predicate = NSPredicate(format: "name contains[c] %@ OR desc contains[c] %@ AND language = %@", query,query,language)
        
        return getArticles(fetchedRequest: fetchRequest)
    }

    
    
    /*
      Read sources
     */
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: sourcesTableName)
            fetchRequest.predicate = NSPredicate(format: "category = %@", category)
        
        return getSources(fetchedRequest: fetchRequest)
    }
    
    
    
    /*
        write article
     */
    
    func replaceArticleEntity(article: Articles){
        if( !entityAlreadyCreated(entity: article, tableName: articleTableName)){
            createArticle(article: article)
        }
    }
    
    
    func replaceSourceEntity(source: Sources){
        if( !entityAlreadyCreated(entity: source, tableName: sourcesTableName)){
            createSource(source: source)
        }
    }
    
    
    fileprivate func entityAlreadyCreated(entity: Replacible, tableName: String) -> Bool{
        let managedContext = getManagedContext()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: tableName)
            fetchRequest.predicate = NSPredicate(format: "description = %@", entity.getUnicueField()!)
        
            do {
                if let result = try managedContext?.fetch(fetchRequest){
                    return result.count > 0
                }
            } catch  {
                
            }
        
            return false
    }
    
    
    
    func storeArticles(articles: [Articles]) -> Bool{
        
        for article in articles{
            replaceArticleEntity(article: article)
        }
        
        return true
    }
    
    
    func storeSources(sources: [Sources]) -> Bool{
        
        for source in sources{
            replaceSourceEntity(source: source)
        }
        
        return true
    }

    fileprivate func createArticle(article: Articles){

        let managedContext = getManagedContext()

        let articleEntity = NSEntityDescription.entity(forEntityName: articleTableName, in: managedContext!)!

            let newArticle = NSManagedObject(entity: articleEntity, insertInto: managedContext)
                newArticle.setValue(article.title, forKeyPath: articleTitle)
                newArticle.setValue(article.description, forKeyPath: articleDescription)
                newArticle.setValue(article.publishedAt, forKeyPath: articleDate)
                newArticle.setValue(article.author, forKeyPath: articleAutor)
                newArticle.setValue(article.urlToImage, forKeyPath: articleImageUrl)
                newArticle.setValue(article.url, forKeyPath: articleUrl)

        do {
            try managedContext!.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    
    fileprivate func createSource(source: Sources){
        
        let managedContext = getManagedContext()
        
        let sourceEntity = NSEntityDescription.entity(forEntityName: sourcesTableName, in: managedContext!)!
        
        let newSource = NSManagedObject(entity: sourceEntity, insertInto: managedContext)
            newSource.setValue(source.category, forKeyPath: sourcesCategory)
            newSource.setValue(source.country, forKeyPath: sourcesCountry)
            newSource.setValue(source.description, forKeyPath: sourcesDescription)
            newSource.setValue(source.language, forKeyPath: sourcesLanguage)
            newSource.setValue(source.name, forKeyPath: sourcesName)
            newSource.setValue(source.url, forKeyPath: sourcesUrl)
        do {
            try managedContext!.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    /*
     file private realizations of read data
     */
    fileprivate func getSources(fetchedRequest: NSFetchRequest<NSFetchRequestResult>) -> Observable<[Sources]> {

        let managedContext = getManagedContext()

        var sources: [Sources]  = []

        do {
            let result = try managedContext?.fetch(fetchedRequest)
            for data in result as! [NSManagedObject] {

                let source = Sources(
                    nName: data.value(forKey: sourcesName) as! String,
                    nDesc: data.value(forKey: sourcesDescription) as! String,
                    nLanguage: data.value(forKey: sourcesLanguage) as! String,
                    nCategory: data.value(forKey: sourcesCategory) as! String,
                    nCountry: data.value(forKey: sourcesCountry) as! String,
                    nUrl: data.value(forKey: sourcesUrl) as! String)


                sources.append(source)
            }

            sourcesSubject.onNext(sources)
        } catch let error {
            sourcesSubject.onError(error)
        }


        return sourcesSubject
    }
    
    
    
    /*
        file private realizations of read data
     */
    fileprivate func getArticles(fetchedRequest: NSFetchRequest<NSFetchRequestResult>) -> Observable<[Articles]> {
        
        let managedContext = getManagedContext()
        
        var articles: [Articles]  = []
        
        do {
            let result = try managedContext?.fetch(fetchedRequest)
            for data in result as! [NSManagedObject] {
                
                let article = Articles(
                    nTitle: data.value(forKey: articleTitle) as! String,
                    nDesc: data.value(forKey: articleDescription) as! String,
                    nUrl: data.value(forKey: articleUrl) as! String,
                    nUrlToImage: data.value(forKey: articleImageUrl) as! String,
                    nDate: data.value(forKey: articleDate) as! String,
                    nAuthor: data.value(forKey: articleAutor) as! String)
                
                articles.append(article)
            }
            
            articleSubject.onNext(articles)
        } catch let error {
            articleSubject.onError(error)
        }
        
        
        return articleSubject
    }
    
    
    fileprivate func getDefaultCountry()->String {
        
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            return countryCode
        } else{
            return ""
        }
    }

}
