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
    }
    
    func getEverythingByLanguage(query: String, language: String) -> Observable<[Articles]> {
        return NetworkServiceRx.shared.getEverythingByLanguage(query: query, language: language)
    }
    
}
