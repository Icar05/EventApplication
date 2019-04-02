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
        self.delegate = self
        self.title = viewControllers?[0].tabBarItem.title
        self.drawNavigationButtonsAlignToId(id: 0)
    }
    
}


extension RootViewController : RootView{
    
    func getDataSource() -> [UIViewController]{
        
        let headerVC = HeaderCreator.assembleModule()
            headerVC.tabBarItem.title = "Headers"
            headerVC.tabBarItem.image = UIImage(named: "headers")
        
        
        let everythingVC = EverythingCreator.assembleModule()
            everythingVC.tabBarItem.title = "Everything"
            everythingVC.tabBarItem.image = UIImage(named: "star")
        
        let sourcesVC = SourcesCreator.assembleModule()
            sourcesVC.tabBarItem.title = "Sources"
            sourcesVC.tabBarItem.image = UIImage(named: "star")
        

        
        return [headerVC, everythingVC, sourcesVC]
    }
}

extension RootViewController: UITabBarControllerDelegate {
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController:
        UIViewController) {
        
        self.title = self.viewControllers?[tabBarController.selectedIndex].tabBarItem.title
        self.drawNavigationButtonsAlignToId(id: tabBarController.selectedIndex)
    }
    
    
    
    func drawNavigationButtonsAlignToId(id: Int){
        
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = nil
        
        let current = self.viewControllers?[selectedIndex] as! TabItem
        let buttons: [UIBarButtonItem?] = current.getNavBarButtons()
        self.addButtonsToNavbar(right: buttons[0], left: buttons[1])
    }
    
    
    func addButtonsToNavbar(right: UIBarButtonItem?, left: UIBarButtonItem?){
        self.navigationItem.rightBarButtonItem = right
        self.navigationItem.leftBarButtonItem = left
    }

}

