//
//  EverythingInteractorImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class EverythingInteractorImpl: EverythingInteractor {
    
    func getEverythingByQuery(query: String) -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getEverythingByQuery(query: query)
            .map{ return self.transformEverything(articles: $0, language: nil, category: nil)}
        
    }
    
    func getEverythingByLanguage(query: String, language: String) -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getEverythingByLanguage(query: query, language: language)
            .map{ return self.transformEverything(articles: $0, language: language, category: nil)}
    }
    
    
    func transformEverything(articles: [Articles], language: String?, category: String? ) -> [Articles]{
        var output: [Articles]  = []
        
        for article: Articles in articles{
            let articleObject = Articles(
                nTitle: article.title ?? "",
                nDesc: article.description ?? "",
                nUrl: article.url ?? "",
                nUrlToImage: article.urlToImage ?? "",
                nDate: article.publishedAt ?? "",
                nAuthor: article.author ?? "",
                nLanguage: CountryUtil.getDefaultCountry(),
                nCategory: "")
            
            
            output.append(articleObject)
        }
        
        return output
    }
    
}
