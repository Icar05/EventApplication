//
//  Repository.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 4/15/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

protocol Repository{
    
    func saveArticles(articles: [Articles]) -> Bool
    
    func saveSources(sources: [Sources]) -> Bool
    
    func getHeadlines() -> [Articles]
    
    func getHeadlines(country: String) -> [Articles]
    
    func getEverything(query: String) -> [Articles]

    func getSourcesByCategory(category: String) -> [Sources]
    
    func loadHeadlines() -> Observable<[Articles]>
    
    func loadHeadlines(country: String) -> Observable<[Articles]>
    
    func loadEverything(query: String) -> Observable<[Articles]>
    
    func loadSourcesByCategory(category: String) -> Observable<[Sources]>
    
}
