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
    
    func saveArticles(articles: [Articles]) -> Observable<Bool> {
        debug(value: "saveArticles")
        return Observable.just(true)
    }
    
    func saveSources(sources: [Sources]) -> Observable<Bool> {
        debug(value: "saveSources")
        return Observable.just(true)
    }
    
    func getHeadlines(country: String) -> Observable<[Articles]> {
        debug(value: "getHeadlines ->  country")
        return Observable.just([])
    }
    
    func getHeadlines(category: String) -> Observable<[Articles]> {
        debug(value: "getHeadlines ->  category")
        return Observable.just([])
    }
    
    func getHeadlines() -> Observable<[Articles]> {
        debug(value: "getHeadlines")
        return Observable.just([])
    }
    
    func getEverything(query: String) -> Observable<[Articles]> {
        debug(value: "getEverything ->  query")
        return Observable.just([])
    }
    
    func getEverything(query: String, language: String) -> Observable<[Articles]> {
        debug(value: "getEverything ->  query, lang")
        return Observable.just([])
    }
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        debug(value: "getSourcesByCategory ->  category")
        return Observable.just([])
    }
    
    
    fileprivate func debug(value: String){
        print("Repository \(value)")
    }
    
}
