//
//  ArticleCell.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class ArticleCell: BaseCell {
    
    
    
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    fileprivate var imageContent: UIImage?
    

    func fillCell(article: Articles){
        self.title.text = article.title
        self.subtitle.text = article.description
        self.date.text = DateTimeUtil.convertDateString(dateString: article.publishedAt)
        self.icon.layer.borderColor = UIColor.lightGray.cgColor
        self.icon.layer.borderWidth = 2.0
        self.loadIcon(input: article.urlToImage)
    }
    
    
    
    func loadIcon(input: String?){
    
//        if (imageContent == nil){
            if let inputStirng = input, let url = URL(string: inputStirng){
    
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url){
                        DispatchQueue.main.async {
                            self.imageContent = UIImage(data: data)
                            self.icon.image = self.imageContent
                        }
                    }
                }
            }
//        }
        
        }
}
    
    

    
    
    

