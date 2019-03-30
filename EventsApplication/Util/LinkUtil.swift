//
//  LinkUtil.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/30.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation

class LinkUtil{
    
    static func getLink(link: String) -> NSMutableAttributedString{
        return  NSMutableAttributedString(
            string: (link),
            attributes:[NSAttributedString.Key.link: URL(string: (link))!])
    }
    
}
