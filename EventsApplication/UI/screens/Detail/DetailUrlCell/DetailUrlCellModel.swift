//
//  DetailUrlCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailUrlCellModel: CustomCellModel{
    
    var url: String?
        
    var reuseIdentifier: String = String(describing: DetailUrlCell.self)
}
