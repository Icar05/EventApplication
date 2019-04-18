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
    
    
    
    func saveArticles(articles: [Articles]) -> Bool {
        return localStorage.storeArticles(articles:articles)
    }
    
    func saveSources(sources: [Sources]) -> Bool {
        return localStorage.storeSources(sources:sources)
    }
    
    func getHeadlines() -> [Articles] {
        return localStorage.getHeadlines()
    }
    
    func getHeadlines(country: String) -> [Articles] {
        return localStorage.getHeadlines(country:country)
    }
    
    func getEverything(query: String) -> [Articles] {
        return localStorage.getEverything(query: query)
    }
    
    func getSourcesByCategory(category: String) -> [Sources] {
        return localStorage.getSourcesByCategory(category: category)
    }
    
    
    
  
    
    

    
}
