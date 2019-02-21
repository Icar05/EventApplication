//
//  BaseCreator.swift
//  EventsApplication
//
//  Created by Eddson on 2/21/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCreator {
    static func assembleModule() -> UIViewController
    static func getControllerIndifier() -> String
    static func getStoryBoardName() -> String
}

extension BaseCreator{
    static func getSelfUIViewController() -> UIViewController{
        let view = UIStoryboard(name: getStoryBoardName(), bundle: nil)
            .instantiateViewController(withIdentifier: getControllerIndifier())
        
        return view
    }
}
