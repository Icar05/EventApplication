//
//  ArticleDetailViewController.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailViewController: UIViewController {
    
    
    var presenter: ArticleDetailPresenter!
    var article: Articles?
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var autor: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillArticleData()
    }
    
    
    func fillArticleData(){
        self.name.text = article?.title
        self.desc.text = article?.description
        self.content.text = article?.content
        self.url.text = article?.url
        self.date.text = convertDateString(dateString: article?.publishedAt)
        self.autor.text = article?.author
        self.loadIcon(input: article?.urlToImage)
        self.image.layer.borderColor = UIColor.lightGray.cgColor
        self.image.layer.borderWidth = 2.0
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
    
    func loadIcon(input: String?){
        if (input != nil){
            let url = URL(string: input!)
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!){
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: data)
                    }
                }
                
            }
        }
    }
}

extension ArticleDetailViewController: ArticleDetailView{
    
}
