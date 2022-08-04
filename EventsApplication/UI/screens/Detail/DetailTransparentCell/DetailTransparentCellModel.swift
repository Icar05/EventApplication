//
//  DetailTitleCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailTransparentCellModel: CustomCellModel{
    
    var text: String
        
    var reuseIdentifier: String = String(describing: DetailTransparentCell.self)
}
