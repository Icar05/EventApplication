//
//  CountryUtil.swift
//  EventsApplication
//
//  Created by Eddson on 4/17/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation

class CountryUtil {
    
    static func getDefaultCountry()->String {
        
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            return countryCode
        } else{
            return ""
        }
    }
    
}
