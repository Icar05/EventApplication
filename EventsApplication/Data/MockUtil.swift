//
//  MockUtil.swift
//  EventsApplication
//
//  Created by ICoon on 07.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

class MockUtil{
    
    public static func getMockArticles(count: Int) -> [Articles]{
            return [Articles].init(repeating: Articles(
                nTitle: "title ",
                nDesc: "desc ",
                nUrl: "http: url.com",
                nUrlToImage: "https://www.trailsofindochina.com/wp-content/uploads/2019/12/Japan-cityscape-over-Odori-Park-Sapporo_shutterstock_1007773915.jpg",
                nDate: "22.22.2022",
                nAuthor: "Author",
                nLanguage: "UA",
                nCategory: "category"), count: count)
    }
    
    public static func getMockArticles() -> [Articles]{
            let number = Int.random(in: 1...10)
            return getMockArticles(count: number)
    }
    
    public static func getMockSources() -> [Sources]{
            let number = Int.random(in: 0...10)
            return [Sources].init(repeating: Sources(
                nName: "Test name",
                nDesc: "Test description",
                nLanguage: "UA",
                nCategory: "technology",
                nCountry: "test country",
                nUrl: "http: dot.net"
            ), count: number)
    }
}
