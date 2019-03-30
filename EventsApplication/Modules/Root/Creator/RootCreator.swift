//
//  RootCreator.swift
//  EventsApplication
//
//  Created by Eddson on 3/26/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class RootCreator: BaseCreator {
    
    static func getControllerIndifier() -> String {
        return "RootViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "Root"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! RootViewController
        
        
        let presenter = RootPresenterImpl()
        let interactor = RootInteractorImpl()
        
        let navigation = UINavigationController(rootViewController: view)
            navigation.navigationBar.tintColor = UIColor.black
        
        
        let backButton = UIBarButtonItem()
            backButton.title = "Back"
            navigation.navigationBar.topItem!.backBarButtonItem = backButton
        
        
            presenter.view = view
            presenter.interactor = interactor
        
            view.presenter = presenter
        
        
        return navigation
    }
    
}
