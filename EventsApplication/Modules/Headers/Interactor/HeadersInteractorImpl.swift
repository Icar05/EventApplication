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
//            .map{ for article in $0 {
//                        article.language = CountryUtil.getDefaultCountry()
//                  }
//
//                return $0
//        }
    }
    
    func getHeadlinesByCountry(country: String) -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getHeadlinesByCountry(country:country)
    }
    
    func getHeadlinesByCategory(category: String) -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getHeadlinesByCategory(category:category)
    }
    
}
