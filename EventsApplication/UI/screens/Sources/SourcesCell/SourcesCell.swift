//
//  SourcesCell.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class SourcesCell: UITableViewCell, CustomCell {
    

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with model: CustomCellModel) {
        guard let m = model as? SourcesCellModel else {
            return
        }
        
        self.title.text = m.source.name
        self.category.text = m.source.category
        
    }
    
}

