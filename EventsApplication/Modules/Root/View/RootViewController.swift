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
        
        
        let headerVC = HeaderCreator.assembleModule()
            headerVC.view.backgroundColor = UIColor.red
            headerVC.tabBarItem.title = "Red"
            headerVC.tabBarItem.image = UIImage(named: "heart")
        
        
        let everythingVC = EverythingCreator.assembleModule()
            everythingVC.view.backgroundColor = UIColor.yellow
            everythingVC.tabBarItem.title = "Yellow"
            everythingVC.tabBarItem.image = UIImage(named: "star")
        
        let sourcesVC = SourcesCreator.assembleModule()
            sourcesVC.view.backgroundColor = UIColor.green
            sourcesVC.tabBarItem.title = "Green"
            sourcesVC.tabBarItem.image = UIImage(named: "star")
        
        
        return [headerVC, everythingVC, sourcesVC]
    }
}

extension RootViewController: UITabBarControllerDelegate {
    
}
