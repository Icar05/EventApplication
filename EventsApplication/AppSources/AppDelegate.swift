//
//  AppDelegate.swift
//  EventsApplication
//
//  Created by Eddson on 2/19/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import CoreData
//import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    
    private let appComponent = AppComponent()
    
    private let appNavigator = ApplicationNavigator()

    var window: UIWindow?
    
    let modelName = "NewsModel"
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool{
        
        //NetworkActivityLogger.shared.level = .debug
        //NetworkActivityLogger.shared.startLogging()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        ApplicationNavigator.presentRootScreen(in: window!)
        
        return true
    }
    
    
    func getNavigator() -> ApplicationNavigator{
        return self.appNavigator
    }
    
    func getAppComponent() -> AppComponent{
        return self.appComponent
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
   
}


