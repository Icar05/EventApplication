//
//  DetailCategoryCell.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit


class DetailCategoryCell: UITableViewCell, CustomCell {
    
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with model: CustomCellModel) {
        guard let m = model as? DetailCategoryCellModel else {
            return
        }
        
        self.categoryLabel.text = m.category
    }
    
}

