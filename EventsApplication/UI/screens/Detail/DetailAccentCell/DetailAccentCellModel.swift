//
//  DetailDescriptionCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailAccentCellModel: CustomCellModel{
    
    var text: String
        
    var reuseIdentifier: String = String(describing: DetailAccentCell.self)
}
