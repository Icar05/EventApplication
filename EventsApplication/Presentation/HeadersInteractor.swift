//
//  HeadersInteractorImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift



class HeadersInteractor {
    
    
    private let repository: Repository
    
    init(repository: Repository){
        self.repository = repository
    }
    
    func getHeadlinesByCountry(country: String) -> Observable<[Articles]> {
        return self.repository.loadHeadlines(country:country)
            .map{ return self.transformHeaders(articles: $0, language: country, category: nil)}
    }
    
    func transformHeaders(articles: [Articles], language: String?, category: String? ) -> [Articles]{
        var output: [Articles]  = []
        
        for article: Articles in articles{
            let articleObject = Articles(
                nTitle: article.title ?? "",
                nDesc: article.description ?? "",
                nUrl: article.url ?? "",
                nUrlToImage: article.urlToImage ?? "",
                nDate: article.publishedAt ?? "",
                nAuthor: article.author ?? "",
                nLanguage: language ?? CountryUtil.getDefaultCountry(),
                nCategory: category ?? "")
            
            
            output.append(articleObject)
        }
        
        return output
    }
    
}
