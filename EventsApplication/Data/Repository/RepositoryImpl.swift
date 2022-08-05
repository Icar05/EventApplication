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
    
    let networkProvider = NetworkServiceRx()
    
    
    
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
    
    func loadHeadlines(country: String) -> Observable<[Articles]> {
        return networkProvider.getHeadlinesByCountry(country: country)
    }
    
    func loadEverything(query: String) -> Observable<[Articles]> {
        return networkProvider.getEverythingByQuery(query: query)
    }
    
    func loadSourcesByCategory(category: String) -> Observable<[Sources]> {
        return networkProvider.getSourcesByCategory(category: category)
    }
    
}
