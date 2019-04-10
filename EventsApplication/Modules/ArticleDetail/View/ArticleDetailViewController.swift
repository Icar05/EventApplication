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
    @IBOutlet weak var stackView: UIBluredStackView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        self.fillArticleData()
//        self.fillTestContent()()
    }
    
    
//    func fillTestContent(){
//        self.name.text = getDefaultContent()
//        self.desc.text = getDefaultContent()
//        self.url.text = getDefaultContent()
//        self.url.text = getDefaultContent()
//        self.date.text = getDefaultContent()
//        self.autor.text = getDefaultContent()
//    }
    
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
        
        
        self.stackView.layoutMargins = UIEdgeInsets(
            top: 8, left: 8, bottom: 8, right: 8)
        self.stackView.isLayoutMarginsRelativeArrangement = true
        
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
    
    
    func getDefaultContent() -> String{
        return "Years ago I arrived one day at Salamanca, New York, where I was to change trains and take the sleeper. There were crowds of people on the platform, and they were all trying to get into the long sleeper train which was already packed. I asked the young man in the booking-office if I could have a sleeping-berth and he answered: «No.» I went off and asked another local official if I could have some poor little corner somewhere in a sleeping-car, but he interrupted me angrily saying, «No, you can’t, every corner is full. Now, don’t bother me any more,» and he turned his back and walked off. I felt so hurt that I said to my companion, «If these people knew who I was, they…»1 But my companion stopped me there,— «Don’t talk such nonsense, we’ll have to put up with this,» he said, «If they knew who you were, do you think it would help you to get a vacant seat1 in a train which has no vacant seats in it? This did not improve my condition at all, but just then I noticed that the porter of a sleeping-car had his eye on me. I saw the expression of his face suddenly change. He whispered to the uniformed conductor, pointing to me, and I realized I was being talked about. Then the conductor came forward, his face all politeness. Can I be of any service to you?» he asked. «Do you want a place in a sleeping-car? Yes,» I said, «I’ll be grateful to you if you can give me a place, anything will do."
    }
    
}
