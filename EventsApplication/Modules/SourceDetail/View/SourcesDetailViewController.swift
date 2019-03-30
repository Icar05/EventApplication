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
    
    @IBOutlet weak var url: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fillSource()
    }
    
    
    func fillSource(){
        name.text = sources?.name
        desc.text = sources?.description
        category.text = sources?.category
        language.text = "Language: "+(sources?.language!)!
        country.text = "Country: "+(sources?.country!)!
        url.attributedText = LinkUtil.getLink(link: (sources?.url)!)
        url.text = sources?.url
    }

}
extension SourcesDetailViewController: SourceDetailView{
    
}


