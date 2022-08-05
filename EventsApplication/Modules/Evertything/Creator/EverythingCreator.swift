//
//  EverythingCreator.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//
import Foundation
import UIKit

class EverythingCreator: BaseCreator {
    
    static func getControllerIndifier() -> String {
        return "EverythingViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "Everything"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! EverythingViewController
        
        
        
        let presenter = EverythingPresenterImpl(repository: view.getApplication().getAppComponent().getRepository())
        let interactor = EverythingInteractor(repository: view.getApplication().getAppComponent().getRepository())
        
            presenter.view = view
            presenter.interactor = interactor
        
            view.presenter = presenter
        
        
        return view
    }
    
}

