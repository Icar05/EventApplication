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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension ArticleDetailViewController: ArticleDetailView{
    
}
