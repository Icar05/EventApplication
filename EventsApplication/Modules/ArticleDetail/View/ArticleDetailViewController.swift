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
        self.url.text = article?.url
        self.url.text = article?.url
        self.date.text = DateTimeUtil.convertDateString(dateString: article?.publishedAt)
        self.autor.text = article?.author
        self.image.layer.borderColor = UIColor.lightGray.cgColor
        self.image.layer.borderWidth = 2.0
        
        let tap: UITapGestureRecognizer =  UITapGestureRecognizer(
            target: self,
            action: #selector(self.openLink))
        
        self.url.addGestureRecognizer(tap)
        self.loadIcon(input: article?.urlToImage)
    }
    
    
    
    
    @objc private func openLink(){
        UIApplication.shared.open(URL(string: self.url.text!)!)
    }
   
    func loadIcon(input: String?){
        if let inputStirng = input, let url = URL(string: inputStirng){
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url){
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
