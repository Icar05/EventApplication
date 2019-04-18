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


class LocalStorage {
    
    
    let articleTableName = "Article"
    let articleTitle = "title"
    let articleDescription = "desc"
    let articleDate = "date"
    let articleAutor = "autor"
    let articleImageUrl = "imgUrl"
    let articleUrl = "url"
    let articleLanguage = "language"
    let articleCategory = "category"
    
    
    let sourcesTableName = "SourcesNews"
    let sourcesCategory = "category"
    let sourcesCountry = "country"
    let sourcesDescription = "desc"
    let sourcesLanguage = "language"
    let sourcesName = "name"
    let sourcesUrl = "url"
    
   
    
    
    
    fileprivate func getManagedContext() -> NSManagedObjectContext?{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.persistentContainer.viewContext
    }
    
    
    
    
    
    
    
    /*
        Read headlines
     */
    func getHeadlines() -> [Articles]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
//            fetchRequest.predicate = NSPredicate(format: "\(articleLanguage) = %@", CountryUtil.getDefaultCountry())
        
        let results =  getArticles(fetchedRequest: fetchRequest)
        
            debug(value: "getHeadlines ->  default \(results)")
        
        return results
    }
    
    func getHeadlines(country: String) -> [Articles]{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
//            fetchRequest.predicate = NSPredicate(format: "\(articleLanguage) = %@", country)
        
        let results =  getArticles(fetchedRequest: fetchRequest)
        
            debug(value: "getHeadlines ->  country \(results)")
        
        return results
    }
    
    func getHeadlines(category: String) -> [Articles] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
//            fetchRequest.predicate = NSPredicate(format: "\(articleCategory) = %@ AND \(articleLanguage) = %@", category, CountryUtil.getDefaultCountry())
        
        let result =  getArticles(fetchedRequest: fetchRequest)
        
            debug(value: "getHeadlines ->  category \(result)")
        
        return result
    }

    
    /*
      Read evertything
    */
    func getEverything(query: String) -> [Articles]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
            fetchRequest.predicate = NSPredicate(format: "\(articleTitle) contains[c] %@ OR \(articleDescription) contains[c] %@", query, query)
        
        let results =  getArticles(fetchedRequest: fetchRequest)
        
            debug(value: "getEverything ->  query \(results)")
        
        return results
        
    }

    func getEverything(query: String, language: String) -> [Articles] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: articleTableName)
            fetchRequest.predicate = NSPredicate(format: "\(articleTitle) contains[c] %@ OR \(articleDescription) contains[c] %@ AND \(articleLanguage) = %@", query,query,language)
        
        let results = getArticles(fetchedRequest: fetchRequest)
        
            debug(value: "getEverything ->  query, lang \(results)")
        
        return results
    }

    
    
    /*
      Read sources
     */
    func getSourcesByCategory(category: String) -> [Sources] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: sourcesTableName)
            fetchRequest.predicate = NSPredicate(format: "\(sourcesCategory) = %@", category)
        
        let results =  getSources(fetchedRequest: fetchRequest)
        
            debug(value: "getSourcesByCategory ->  category \(results)")
        
        return results
    }
    
    
    /*
     file private realizations of read data
     */
    fileprivate func getSources(fetchedRequest: NSFetchRequest<NSFetchRequestResult>) -> [Sources] {
        
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
            
            return sources
        } catch let error {
            debug(value: "Error while getArticles -> \(error.localizedDescription)")
            return []
        }
    }
    
    
    
    /*
     file private realizations of read data
     */
    fileprivate func getArticles(fetchedRequest: NSFetchRequest<NSFetchRequestResult>) -> [Articles] {
        
        let managedContext = getManagedContext()
        
        var articles: [Articles]  = []
        
        do {
            let result = try managedContext?.fetch(fetchedRequest)
            for data in result as! [NSManagedObject] {
                
                let article = Articles(
                    nTitle: data.value(forKey: articleTitle) as? String ?? "",
                    nDesc: data.value(forKey: articleDescription) as? String ?? "",
                    nUrl: data.value(forKey: articleUrl) as? String ?? "",
                    nUrlToImage: data.value(forKey: articleImageUrl) as? String ?? "",
                    nDate: data.value(forKey: articleDate) as? String ?? "",
                    nAuthor: data.value(forKey: articleAutor) as? String ?? "",
                    nLanguage: data.value(forKey: articleLanguage) as? String ?? "",
                    nCategory: data.value(forKey: articleCategory) as? String ?? ""
                )
                
                articles.append(article)
            }
            
            return articles
        } catch let error {
            debug(value: "Error while getArticles -> \(error.localizedDescription)")
            return []
        }
    }
    
    
    
    
    
    
    /*
        write data
     */
    
    
    func storeArticles(articles: [Articles]) -> Bool{
        
        for article in articles{
            replaceArticleEntity(article: article)
        }
        
        debug(value: "saveArticles")
        return true
    }
    
    
    func storeSources(sources: [Sources]) -> Bool{
        
        for source in sources{
            replaceSourceEntity(source: source)
        }
        
        debug(value: "saveSources")
        return true
    }
    
    
    func replaceArticleEntity(article: Articles){
        
        let result = entityAlreadyCreated(entity: article, tableName: articleTableName)
        
        if( !result){
            createArticle(article: article)
        }
        
        
//        debug(value: "article , entityAlreadyCreated \(result)")
    }
    
    
    func replaceSourceEntity(source: Sources){
        
        let result = entityAlreadyCreated(entity: source, tableName: sourcesTableName)
        
        if(!result){
            createSource(source: source)
        }
        
//        debug(value: "source, entityAlreadyCreated \(result)")
    }
    
    
    fileprivate func entityAlreadyCreated(entity: Replacible, tableName: String) -> Bool{
        let managedContext = getManagedContext()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: tableName)
            fetchRequest.predicate = NSPredicate(format: "desc = %@", entity.getUnicueField()!)
        
            do {
                if let result = try managedContext?.fetch(fetchRequest){
                    return result.count > 0
                }
            } catch let error {
                 debug(value: "entity allready created error \(error)")
            }
        
            return false
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
            print("Repository: Could not save article. \(error), \(error.userInfo)")
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
            print("Repository: Could not save source. \(error), \(error.userInfo)")
        }
    }
    
    
    
    /*
     debug
     */
    fileprivate func debug(value: String){
        print("Repository \(value)")
    }

}
