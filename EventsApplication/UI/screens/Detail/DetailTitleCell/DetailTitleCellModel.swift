//
//  DetailTitleCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailTitleCellModel: DetailModel{
    
    var title: String
        
    var reuseIdentifier: String = String(describing: DetailTitleCell.self)
}
