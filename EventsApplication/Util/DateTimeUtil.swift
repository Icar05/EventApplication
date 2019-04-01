//
//  DateTimeUtil.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/30.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation

class DateTimeUtil{
    
   static func convertDateString(dateString : String!) -> String {
        
        let sourceFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'";
        let desFormat = "dd.MM.YYYY"
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = sourceFormat
            dateFormatter.locale = .current
    
    
        let date = dateFormatter.date(from: dateString)
    
        guard date !=  nil else {return ""}
    
        dateFormatter.dateFormat = desFormat
        return dateFormatter.string(from: date!)
    }
}
