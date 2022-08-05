//
//  SourcesCellModel.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

struct SourcesCellModel: CustomCellModel{
    
    var source: Sources
            
    var reuseIdentifier: String = String(describing: SourcesCell.self)
}
