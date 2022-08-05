//
//  NewsCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct NewsCellModel: CustomCellModel{
    
    var article: Articles
            
    var reuseIdentifier: String = String(describing: NewsCell.self)
}
