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
        self.name.text = getTestContent()
        self.desc.text = getTestContent()
        self.url.text = getTestContent()
        self.url.text = getTestContent()
        self.date.text = getTestContent()
        self.autor.text = getTestContent()
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
    
    
    func getTestContent() -> String{
        return "Почему все кричат о ужасной жизни? Или это так модно прикидываться несчастным и винить всех и во всем? Если уж так плохо - пойдите на кладбище. Серьезно, пойдите и посмотрите как там 'весело' и как лежащие там люди или то, что осталось - меняют свою жизнь. У каждого человека есть жизнь и она очень мала в сравнении с временем во Вселенной. Так что хватит ныть, поднимаем себя и живем как нравится. Не знаем что нравится? Напишите хотя бы на листочке то, чего хотите. Ну, не миллион долларов ничего не делая при этом. А хотя бы  цель. Хотите новый холодильник? Или куда-то поехать. Так что мешает? Нет времени или денег. Меняйте, делайте, вперед."
    }
    
}
