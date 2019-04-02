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
        
        switch id {
            case 0: addButtonsToNavbar(
                    right: self.createNavItem(title: "Country",selector: "selectCountry"),
                    left: self.createNavItem(title: "Category",selector: "selectCategory"))
                    break
            
            case 1: addButtonsToNavbar(
                    right: self.createNavItem(title: "Query", selector: "selectQuery"),
                    left: self.createNavItem(title: "Lang", selector: "selectLanguage"))
                    break
            
            case 2: addButtonsToNavbar(
                    right: self.createNavItem(title: "Category", selector:"selectCategory"),
                    left: nil)
                    break
            
            default: break
            
        }
    }
    
    
    func addButtonsToNavbar(right: UIBarButtonItem?, left: UIBarButtonItem?){
        self.navigationItem.rightBarButtonItem = right
        self.navigationItem.leftBarButtonItem = left
    }
    
    func getCurrentViewController() -> UIViewController?{
        return self.viewControllers?[selectedIndex]
    }
    
    func createNavItem(title: String, selector: String) -> UIBarButtonItem{
        return UIBarButtonItem(title: title, style: .plain, target: self,
                               action: Selector((selector)))
    }


    /*
        handle selection on navigation
     */
    @objc func selectCategory(){
        if let target: HasCategory = getCurrentViewController() as? HasCategory {
            ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.categories, completion: { category in
                target.categoryDidChanged(category: category)
            })
        }
    }
    
    @objc func selectCountry(){
       if let target: HasCountry = getCurrentViewController() as? HasCountry {
            ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.languages, completion: { country in
                target.countryDidChanged(country: country)
            })
        }
    }
    
    @objc func selectLanguage(){
        if let target: HasLanguage = getCurrentViewController() as? HasLanguage {
            ApplicationNavigator.presentSelectionDialog(current: self, datasource: ValueForSelector.languages, completion: { language in
                target.languageDidChanged(language: language)
            })
        }
    }
    
    @objc func selectQuery(){
           if let target: HasQuery = getCurrentViewController() as? HasQuery {
                ApplicationNavigator.presentSearchDialog(current: self,
                    completion: { search in
                        target.queryDidChanged(query: search)
                })
            }
    }

}

