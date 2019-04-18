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
        return localStorage.getHeadlines(country:country)
    }
    
    func getHeadlines(category: String) -> Observable<[Articles]> {
        return localStorage.getHeadlines(category:category)
    }
    
    func getHeadlines(wasStored: Bool) -> Observable<[Articles]> {
        return localStorage.getHeadlines()
    }
    
    func getEverything(query: String) -> Observable<[Articles]> {
        return localStorage.getEverything(query:query)
    }
    
    func getEverything(query: String, language: String) -> Observable<[Articles]> {
        return localStorage.getEverything(query: query, language: language)
    }
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        return localStorage.getSourcesByCategory(category:category)
    }
    
    
    /*
     write data
    */
    func saveArticles(articles: [Articles]) -> Bool {
        return localStorage.storeArticles(articles: articles)
    }
    
    func saveSources(sources: [Sources]) -> Bool {
        return localStorage.storeSources(sources: sources)
    }
    
    
   
    
}
