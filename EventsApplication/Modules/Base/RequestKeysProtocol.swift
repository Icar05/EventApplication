//
//  RequestKeysProtocol.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/04/03.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation

protocol HasCategory {
    func categoryDidChanged(category: String)
}

protocol HasLanguage {
    func languageDidChanged(language: String)
}

protocol HasQuery {
    func queryDidChanged(query: String)
}

protocol HasCountry {
    func countryDidChanged(country: String)
}
