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
            case 0: self.navigationItem.rightBarButtonItem =
                    self.createNavItem(title: "Country",selector: "selectCountry")
            
                    self.navigationItem.leftBarButtonItem =
                    self.createNavItem(title: "Category",selector: "selectCategory")
            
                    break
            
            case 1: self.navigationItem.rightBarButtonItem =
                    self.createNavItem(title: "Query", selector: "selectQuery")
            
                    self.navigationItem.leftBarButtonItem =
                    self.createNavItem(title: "Language", selector: "selectLanguage")
            
                    break
            
            case 2: self.navigationItem.leftBarButtonItem =
                    self.createNavItem(title: "Category",selector: "selectCategory")
            
                    break
            
            default: break
            
        }
    }
    
    
    
    func getCurrentViewController() -> UIViewController?{
        return self.viewControllers?[selectedIndex]
    }
    
    
    func createNavItem(title: String, selector: String) -> UIBarButtonItem{
        return UIBarButtonItem(title: title, style: .plain, target: self,
                               action: Selector((selector)))
    }


    
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

