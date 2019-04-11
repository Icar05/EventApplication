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
        self.language.text = "\(NSLocalizedString("Language", comment: "")): "+(sources?.language!)!
        self.country.text = "\(NSLocalizedString("Country", comment: "")): "+(sources?.country!)!
        self.prepareStackView()
        self.prepareUrl()
    }
    
    
    
    @objc private func openLink(){
        UIApplication.shared.open(URL(string: self.url.text!)!)
    }
    
    
    func prepareUrl(){
        let tap: UITapGestureRecognizer =  UITapGestureRecognizer(
            target: self,
            action: #selector(self.openLink))
        self.url.text = sources?.url
        self.url.addGestureRecognizer(tap)
    }
    
    func prepareStackView(){
        self.stackView.layoutMargins = UIEdgeInsets(
            top: 8, left: 8, bottom: 8, right: 8)
        self.stackView.isLayoutMarginsRelativeArrangement = true
    }

}
extension SourcesDetailViewController: SourceDetailView{
    
}


