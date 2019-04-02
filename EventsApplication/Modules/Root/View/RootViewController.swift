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
//          self.test()
    
    }
    
    
    func test(){
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))
        
        navigationItem.rightBarButtonItems = [add, play]
    }
    
    @objc func addTapped(){
        navigationItem.rightBarButtonItem  = nil
    }
    
    @objc func playTapped(){
        navigationItem.rightBarButtonItem  = nil
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
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.title = self.viewControllers?[tabBarController.selectedIndex].tabBarItem.title
    }
}
extension RootViewController{
    
    func debugParent(){
        print("debugParent -> this is the parent view controller!")
    }
}
