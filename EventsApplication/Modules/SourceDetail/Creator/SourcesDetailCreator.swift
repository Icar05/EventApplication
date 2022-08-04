//
//  SourcesDetailCreator.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class SourcesDetailCreator: BaseCreator {
    
    static func assembleModule() -> UIViewController {
        
        let view = getSelfUIViewController() as! SourcesDetailViewController
        
        
        let presenter = SourceDetailPresenterImpl()
        let interactor = SourceDetailInteractorImpl()
        
            presenter.view = view
            presenter.interactor = interactor
        
            view.presenter = presenter
        
        return view
    }
    
    static func getControllerIndifier() -> String {
        return "SourcesDetailViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "SourcesDetail"
    }
    
    
}
