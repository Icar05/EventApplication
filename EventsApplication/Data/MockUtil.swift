//
//  MockUtil.swift
//  EventsApplication
//
//  Created by ICoon on 07.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

class MockUtil{
    
    public static func getMockArticles(count: Int, country: String) -> [Articles]{
        var res: [Articles] = []
        
        for _ in 0...count{
            res.append(Articles(
                nTitle: " title for \(country) ",
                nDesc: "\(Date().timeIntervalSince1970)",
                nUrl: "http: url.com",
                nUrlToImage: "https://www.trailsofindochina.com/wp-content/uploads/2019/12/Japan-cityscape-over-Odori-Park-Sapporo_shutterstock_1007773915.jpg",
                nDate: "11.01.2022",
                nAuthor: "Author",
                nLanguage: country,
                nCategory: "category"))
        }
        
        return res
    }
    
    public static func getMockArticles(country: String) -> [Articles]{
            let number = Int.random(in: 1...10)
        print("def m Language: \(country)")
            return getMockArticles(count: number, country: country)
    }
    
    public static func getMockSources() -> [Sources]{
            let number = Int.random(in: 0...10)
            return [Sources].init(repeating: Sources(
                nName: "Test name",
                nDesc: "\(Date().timeIntervalSince1970)",
                nLanguage: "UA",
                nCategory: "technology",
                nCountry: "test country",
                nUrl: "http: dot.net"
            ), count: number)
    }
}
