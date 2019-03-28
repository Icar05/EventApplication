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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension SourcesDetailViewController: SourceDetailView{
    
}
