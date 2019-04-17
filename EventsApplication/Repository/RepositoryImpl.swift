//
//  RepositoryImpl.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 4/15/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class RepositoryImpl : Repository {
    
    
    static let shared = RepositoryImpl()
    
    let localStorage = LocalStorage()
    
    

    /*
     read data
    */
 
    func getHeadlines(country: String) -> Observable<[Articles]> {
        debug(value: "getHeadlines ->  country")
        return localStorage.getHeadlines(country:country)
    }
    
    func getHeadlines(category: String) -> Observable<[Articles]> {
        debug(value: "getHeadlines ->  category")
        return localStorage.getHeadlines(category:category)
    }
    
    func getHeadlines() -> Observable<[Articles]> {
        debug(value: "getHeadlines")
        return localStorage.getHeadlines()
    }
    
    func getEverything(query: String) -> Observable<[Articles]> {
        debug(value: "getEverything ->  query")
        return localStorage.getEverything(query:query)
    }
    
    func getEverything(query: String, language: String) -> Observable<[Articles]> {
        debug(value: "getEverything ->  query, lang")
        return localStorage.getEverything(query: query, language: language)
    }
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        debug(value: "getSourcesByCategory ->  category")
        return localStorage.getSourcesByCategory(category:category)
    }
    
    
    /*
     write data
    */
    func saveArticles(articles: [Articles]) -> Bool {
        debug(value: "saveArticles")
        return localStorage.storeArticles(articles: articles)
    }
    
    func saveSources(sources: [Sources]) -> Bool {
        debug(value: "saveSources")
        return localStorage.storeSources(sources: sources)
    }
    
    
    /*
     debug
     */
    fileprivate func debug(value: String){
        print("Repository \(value)")
    }
    
}
