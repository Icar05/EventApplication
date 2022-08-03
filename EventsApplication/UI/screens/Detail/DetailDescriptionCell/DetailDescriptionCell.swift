//
//  DetailDescriptionCell.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailDescriptionCell: UITableViewCell, DetailCell {
    
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with model: DetailModel) {
        guard let m = model as? DetailDescriptionCellModel else {
            return
        }
        
        self.descriptionLabel.text = m.description
    }
    
}

