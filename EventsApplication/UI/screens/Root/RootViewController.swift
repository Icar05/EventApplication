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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = prepareControllers()
        self.delegate = self
        self.title = viewControllers?[0].tabBarItem.title
        self.drawNavigationButtonsAlignToId(id: 0)
        self.tabBar.tintColor = .accentColor
        self.tabBar.unselectedItemTintColor = UIColor.black
    }
    
    func prepareControllers() -> [UIViewController]{
        
        let navigator = getApplication().getNavigator()
        let component = getApplication().getAppComponent()
        let headerInteractor = component.getHeaderInteractor()
        let repository = component.getRepository()
        
        let newsVC = navigator.getNewsViewController(
            interactor: headerInteractor,
            repository: repository)
            newsVC.tabBarItem.title = NSLocalizedString("Headers", comment: "")
            newsVC.tabBarItem.image = .tabIcon
        
        
        let everythingVC = EverythingCreator.assembleModule()
            everythingVC.tabBarItem.title = NSLocalizedString("Everything", comment: "")
            everythingVC.tabBarItem.image = .tabIcon
        
        let sourcesVC = SourcesCreator.assembleModule()
            sourcesVC.tabBarItem.title = NSLocalizedString("Sources", comment: "")
            sourcesVC.tabBarItem.image = .tabIcon
        

        
        return [newsVC, everythingVC, sourcesVC]
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
        self.navigationItem.rightBarButtonItem = current.getNavBarButton()
    }

}

