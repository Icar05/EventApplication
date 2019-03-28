//
//  SourcesCell.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class SourcesCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var url: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    
    func fillCell(sources: Sources){
        self.title.text = sources.name
        self.desc.text = sources.description
        self.url.text = sources.url
        self.category.text = sources.category
    }
    
}
