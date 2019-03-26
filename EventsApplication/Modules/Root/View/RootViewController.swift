//
//  RootViewController.swift
//  EventsApplication
//
//  Created by Eddson on 3/26/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UITabBarController {
    
    
    
    var presenter: RootPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = getDataSource()
        MockNetworkTester().testGetDefaultHeadlines()
    }
    
}


extension RootViewController : RootView{
    
    func getDataSource() -> [UIViewController]{
        
        let vc1 = SignInCreator.assembleModule()
            vc1.view.backgroundColor = UIColor.orange
            vc1.tabBarItem.title = "Orange"
            vc1.tabBarItem.image = UIImage(named: "heart")
        
        // Set up the second View Controller
        let vc2 = UIViewController()
            vc2.view.backgroundColor = UIColor.purple
            vc2.tabBarItem.title = "Purple"
            vc2.tabBarItem.image = UIImage(named: "star")
        
        let vc3 = UIViewController()
            vc3.view.backgroundColor = UIColor.green
            vc3.tabBarItem.title = "Green"
            vc3.tabBarItem.image = UIImage(named: "star")
        
        // Set up the Tab Bar Controller to have two tabs
        return [vc1, vc2, vc3]
    }
}

extension RootViewController: UITabBarControllerDelegate {
    
}
