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
        <#code#>
    }
    
    func saveSources(articles: [Sources]) -> Observable<Bool> {
        <#code#>
    }
    
    func getHeadlines(country: String) -> Observable<[Articles]> {
        <#code#>
    }
    
    func getHeadlines(category: String) -> Observable<[Articles]> {
        <#code#>
    }
    
    func getHeadlines() -> Observable<[Articles]> {
        <#code#>
    }
    
    func getEverything(query: String) -> Observable<[Articles]> {
        <#code#>
    }
    
    func getEverything(query: String, language: String) -> Observable<[Articles]> {
        <#code#>
    }
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]> {
        <#code#>
    }
    
    
}
