//
//  DetailAuthorCell.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailAuthorCell: UITableViewCell, DetailCell {
    
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var datelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with model: DetailModel) {
        guard let m = model as? DetailAuthorCellModel else {
            return
        }
        
        self.authorLabel.text = m.author
        self.datelabel.text = m.date
        
    }
}
