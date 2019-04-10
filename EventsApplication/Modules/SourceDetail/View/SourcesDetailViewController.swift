//
//  SourcesDetailViewController.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class SourcesDetailViewController: UIViewController {
    
    var presenter: SourceDetailPresenter!
    var sources: Sources?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var language: UILabel!
    
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var stackView: UIBluredStackView!
    @IBOutlet weak var url: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fillSource()
    }
    
    
    func fillSource(){
        self.name.text = sources?.name
        self.desc.text = sources?.description
        self.category.text = sources?.category
        self.language.text = "Language: "+(sources?.language!)!
        self.country.text = "Country: "+(sources?.country!)!
        self.url.text = sources?.url
        
        self.stackView.layoutMargins = UIEdgeInsets(
            top: 8, left: 8, bottom: 8, right: 8)
        self.stackView.isLayoutMarginsRelativeArrangement = true
        
        let tap: UITapGestureRecognizer =  UITapGestureRecognizer(
            target: self,
            action: #selector(self.openLink))
    
        self.url.addGestureRecognizer(tap)
    }
    
    @objc private func openLink(){
        print("openlink ")
        UIApplication.shared.open(URL(string: self.url.text!)!)
    }

}
extension SourcesDetailViewController: SourceDetailView{
    
}


