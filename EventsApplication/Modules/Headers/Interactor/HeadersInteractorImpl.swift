//
//  HeadersInteractorImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class HeadersInteractorImpl: HeadersInteractor {
    
    func getDefaultHeadlines() -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getDefaultHeadlines()
            .map{ return self.transformHeaders(articles: $0, language: CountryUtil.getDefaultCountry(), category: nil)}.asSingle()
    }
    
    
    func getHeadlinesByCountry(country: String) -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getHeadlinesByCountry(country:country)
            .map{ return self.transformHeaders(articles: $0, language: country, category: nil)}
    }
    
    func getHeadlinesByCategory(category: String) -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getHeadlinesByCategory(category:category)
            .map{ return self.transformHeaders(articles: $0, language: CountryUtil.getDefaultCountry(), category: category)}
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
                nLanguage: CountryUtil.getDefaultCountry(),
                nCategory: "")
            
            
            output.append(articleObject)
        }
        
        return output
    }
    
}
