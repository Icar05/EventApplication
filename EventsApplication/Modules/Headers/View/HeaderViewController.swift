//
//  HeaderViewController.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class HeadersViewController: UIViewController {
    
    
    @IBAction func moveSignup(_ sender: Any) {
        Router.presentSingInController(current: self, data: nil)
    }
    
    var presenter: HeaderPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
}


extension HeadersViewController : HeaderView{
    
}


