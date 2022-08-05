//
//  SourcesCreator.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class SourcesCreator: BaseCreator {
    
    static func getControllerIndifier() -> String {
        return "SourcesViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "Sources"
    }
    
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! SourcesViewController
        
        
        let presenter = SourcesPresenterImpl(repository: view.getApplication().getAppComponent().getRepository())
        let interactor = SourcesInteractor(repository: view.getApplication().getAppComponent().getRepository())
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        
        return view
    }
    
}
