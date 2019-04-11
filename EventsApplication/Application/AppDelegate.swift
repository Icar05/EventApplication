//
//  AppDelegate.swift
//  EventsApplication
//
//  Created by Eddson on 2/19/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit
//import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        NetworkActivityLogger.shared.level = .debug
//        NetworkActivityLogger.shared.startLogging()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        ApplicationNavigator.presentRootScreen(in: window!)
        
        return true
    }
    
    
   
}

extension UIImage{
    static let applicationBackground = UIImage(named: "back.png")!
}

extension UIColor {
    
    static let accentColor = UIColor(named: "Accent")
    static let appGrayColor = UIColor(named: "ApplicationGray")
    static let urlColor = UIColor(named: "Url")
}

