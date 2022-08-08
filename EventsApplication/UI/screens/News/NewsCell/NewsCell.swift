//
//  NewsCell.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import UIKit


/**
 let source : Source?
 let author : String?
 let title : String?
 let description : String?
 let url : String?
 let urlToImage : String?
 let publishedAt : String?
 let content : String?
 let language: String?
 let category: String?
 */
class NewsCell: UITableViewCell, CustomCell {
    
    
    
    private var task: URLSessionDataTask? = nil
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsTitle: UILabel!
        
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.newsImage.layer.borderColor = UIColor.lightGray.cgColor
        self.newsImage.layer.borderWidth = 2.0
    }
    
    func update(with model: CustomCellModel) {
        guard let m = model as? NewsCellModel else {
            return
        }
        
        self.newsTitle.text = m.article.title
        
        guard let imgUrl = m.article.urlToImage else{
            self.newsImage.image = .defaultImage
            return
        }
        
        self.task = self.newsImage.downloadImageFrom(link: imgUrl, contentMode: .scaleAspectFit)
    }
    
}

