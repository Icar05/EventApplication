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
    
    
    func fillCell(article: Articles){
        self.title.text = article.title
        self.subtitle.text = article.description
        self.date.text = article.publishedAt
        self.loadIcon(input: article.urlToImage)
        
    }
    
    
    func loadIcon(input: String?){
        if (input != nil){
            let url = URL(string: input!)
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!){
                    DispatchQueue.main.async {
                        self.icon.image = UIImage(data: data)
                    }
                }
                
            }
        }
    }
    
}
