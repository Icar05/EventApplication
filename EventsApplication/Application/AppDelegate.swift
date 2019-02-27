//
//  AppDelegate.swift
//  EventsApplication
//
//  Created by Eddson on 2/19/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        Router.presentRootScreen(in: window!)
        
        return true
    }
    
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
    }
}

