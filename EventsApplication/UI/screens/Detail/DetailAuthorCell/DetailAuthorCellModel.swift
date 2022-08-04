//
//  DetailAuthorCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailAuthorCellModel: CustomCellModel{
    
    var author: String?
    
    var date: String?
        
    var reuseIdentifier: String = String(describing: DetailAuthorCell.self)
}
