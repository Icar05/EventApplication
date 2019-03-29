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
        self.date.text = convertDateString(dateString: article.publishedAt)
        self.loadIcon(input: article.urlToImage)
        self.icon.layer.borderColor = UIColor.lightGray.cgColor
        self.icon.layer.borderWidth = 2.0
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
    
    
     func convertDateString(dateString : String!) -> String {
        
        let sourceFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'";
        let desFormat = "dd/MM/YYYY - HH:mm:ss"
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = sourceFormat
            dateFormatter.locale = .current
        
        let date = dateFormatter.date(from: dateString)
            dateFormatter.dateFormat = desFormat
        
        return dateFormatter.string(from: date!)
    }
}