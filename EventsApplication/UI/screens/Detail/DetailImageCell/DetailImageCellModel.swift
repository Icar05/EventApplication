//
//  DetailImageCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 03.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct DetailImageCellModel: CustomCellModel{
    
    var image: String?
        
    var reuseIdentifier: String = String(describing: DetailImageCellTableViewCell.self)
}
