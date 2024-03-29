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
        let everythingInteractor = component.getEverythingInteractor()
        let sourcesInteractor  = component.getSourcesInteractor()
        let repository = component.getRepository()
        
        let newsVC = navigator.getNewsViewController(
            interactor: headerInteractor,
            repository: repository)
            newsVC.tabBarItem.title = Translations.General.Headers
            newsVC.tabBarItem.image = .tabIcon
        
        
        let worldNewsVC = navigator.getWorldNewsViewController(
            interactor: everythingInteractor,
            repository: repository)
            worldNewsVC.tabBarItem.title = Translations.General.Everything
            worldNewsVC.tabBarItem.image = .tabIcon
        
        let sourcesVC = navigator.getSourcesViewController(
            interactor: sourcesInteractor, repository: repository)
            sourcesVC.tabBarItem.title = Translations.General.Sources
            sourcesVC.tabBarItem.image = .tabIcon
        

        
        return [newsVC, worldNewsVC, sourcesVC]
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
        
        
        let current = self.viewControllers?[selectedIndex]
        
        guard let navigationVC = current as? UINavigationController,
              let root = navigationVC.viewControllers.first,
              let tabItem = root as? TabItem else {
                  return
              }
        
        root.title = navigationVC.tabBarItem.title
        root.navigationItem.rightBarButtonItem = tabItem.getRightNavBarButton()
        root.navigationItem.leftBarButtonItem = tabItem.getLeftNavBarButton()
        navigationVC.navigationBar.tintColor = UIColor.black

    }

}

