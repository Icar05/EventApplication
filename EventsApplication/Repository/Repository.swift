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

    func getHeadlines(category: String) -> [Articles]
    
    func getEverything(query: String) -> [Articles]

    func getSourcesByCategory(category: String) -> [Sources]
    
}
