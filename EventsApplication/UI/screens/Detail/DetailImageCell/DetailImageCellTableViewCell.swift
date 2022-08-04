//
//  DetailImageCellTableViewCell.swift
//  EventsApplication
//
//  Created by ICoon on 03.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class DetailImageCellTableViewCell: UITableViewCell, CustomCell {
    
    
    private var task: URLSessionDataTask? = nil
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var container: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        self.task?.cancel()
        self.detailImage.image = .defaultImage
    }
    
    func update(with model: CustomCellModel) {
        guard let m = model as? DetailImageCellModel else {
            return
        }

        guard let imgUrl = m.image else{
            self.detailImage.image = .defaultImage
            return
        }
        
        self.task = self.detailImage.downloadImageFrom(link: imgUrl, contentMode: .scaleToFill)

    }
    
}


