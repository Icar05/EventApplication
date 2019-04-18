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
    
    func getHeadlines(country: String) -> Observable<[Articles]>
    
    func getHeadlines(category: String) -> Observable<[Articles]>
    
    func getHeadlines(wasStored: Bool) -> Observable<[Articles]>
    
    func getEverything(query: String) -> Observable<[Articles]>
    
    func getEverything(query: String, language: String) -> Observable<[Articles]>
    
    func getSourcesByCategory(category: String) -> Observable<[Sources]>
    
}
