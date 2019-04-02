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
        
        let index = tabBarController.selectedIndex
        
        self.title = self.viewControllers?[index].tabBarItem.title
        self.drawNavigationButtonsAlignToId(id: index)
    }
    
    func drawNavigationButtonsAlignToId(id: Int){
        
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = nil
        
        switch id {
            case 0: self.navigationItem.rightBarButtonItem = getCountryItem()
                    self.navigationItem.leftBarButtonItem = getCategoryItem()
                    break
            
            case 1: self.navigationItem.rightBarButtonItem = getQueryItem()
                    self.navigationItem.leftBarButtonItem = getLanguageItem()
                    break
            
            case 2: self.navigationItem.leftBarButtonItem = getCategoryItem()
                   break
            
            default: break
            
        }
    }
    

    func getCategoryItem() -> UIBarButtonItem{
        return UIBarButtonItem(title: "Category", style: .plain, target: self, action: #selector(selectCategorie))
    }
    
    func getQueryItem() -> UIBarButtonItem{
        return UIBarButtonItem(title: "Query", style: .plain, target: self, action: #selector(selectQuery))
    }
    
    func getCountryItem() -> UIBarButtonItem{
        return UIBarButtonItem(title: "Country", style: .plain, target: self, action: #selector(selectCountry))
    }
    
    func getLanguageItem() -> UIBarButtonItem{
        return UIBarButtonItem(title: "Language", style: .plain, target: self, action: #selector(selectLanguage))
    }
    
    @objc func selectCategorie(){
        ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.categories, completion: { category in
        })
    }
    
    @objc func selectCountry(){
        ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.languages, completion: { category in
        })
    }
    
    @objc func selectLanguage(){
        ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.languages, completion: { category in
        })
    }
    
    @objc func selectQuery(){
        ApplicationNavigator.presentSearchDialog(current: self,
            completion: { search in
            
        })
    }
    
}

