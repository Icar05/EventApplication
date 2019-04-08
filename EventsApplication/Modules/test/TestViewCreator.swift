//
//  TestViewCreator.swift
//  EventsApplication
//
//  Created by Eddson on 4/8/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class TestViewCreator: BaseCreator {
    
    
    static func assembleModule() -> UIViewController {
        let view = getSelfUIViewController() as! TestViewController
        
        return view
    }
    
    static func getControllerIndifier() -> String {
        return "TestViewController"
    }
    
    static func getStoryBoardName() -> String {
        return "test"
    }
    
    
}
