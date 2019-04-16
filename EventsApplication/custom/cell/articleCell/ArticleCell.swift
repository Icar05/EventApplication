//
//  ArticleCell.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    fileprivate var task:URLSessionDataTask?
    
    
    

    func fillCell(article: Articles){
        self.title.text = article.title
        self.subtitle.text = article.description
        self.date.text = DateTimeUtil.convertDateString(dateString: article.publishedAt)
        self.icon.layer.borderColor = UIColor.lightGray.cgColor
        self.icon.layer.borderWidth = 2.0
        self.icon.image = .defaultImage
        self.task = self.icon.downloadImageFrom(link: article.urlToImage, contentMode: .scaleAspectFit)
    }
    
    
    override func prepareForReuse() {
        self.task?.cancel()
        self.icon.image = .defaultImage
    }
    
    
}
    
    

    
    
    

