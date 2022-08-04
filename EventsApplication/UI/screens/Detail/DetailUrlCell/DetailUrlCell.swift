//
//  DetailUrlCell.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailUrlCell: UITableViewCell, CustomCell {
    
    
    
    @IBOutlet weak var urlLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.urlLabel.isUserInteractionEnabled = true
        self.urlLabel.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(self.openLink)))        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with model: CustomCellModel) {
        guard let m = model as? DetailUrlCellModel else {
            return
        }
        
        self.urlLabel.text = m.url
    }
    
    @objc private func openLink(){
        UIApplication.shared.open(URL(string: self.urlLabel.text!)!)
    }
}

