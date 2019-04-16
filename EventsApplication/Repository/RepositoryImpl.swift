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
    
    func saveArticles(articles: [Articles]) -> Observable<Bool> {
        return Observable.just(true)
    }
    
    func saveSources(articles: [Sources]) -> Observable<Bool> {
        return Observable.just(true)
    }
    
    func getHeadlines(country: String) -> Observable<[Articles]> {
        return Observable.just([])
    }
    
    func getHeadlines(category: String) -> Observable<[Articles]> {
        return Observable.just([])
    }
    
    func getHeadlines() -> Observable<[Articles]> {
        return Observable.just([])
    }
    
    func getEverything(query: String) -> Observable<[Articles]> {
        return Observable.just([])
    }
    
    func getEverything(query: String, language: String) -> Observable<[Articles]> {
        return Observable.just([])
    }
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        return Observable.just([])
    }
    
    
}
