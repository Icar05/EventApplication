//
//  to read.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/02/27.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation


//pod 'AlamofireNetworkActivityLogger', '~> 2.0'
//In your AppDelegate:
//
//import AlamofireNetworkActivityLogger
//Then in your didFinishLaunchingWithOptions, add this:
//
//NetworkActivityLogger.shared.level = .debug
//NetworkActivityLogger.shared.startLogging()
//EDIT: I've actually encountered crashes with this in production. To be on the safe side, use "build flags" to only use this in debug, something like this:
//
//#if DEBUG
//NetworkActivityLogger.shared.level = .debug
//NetworkActivityLogger.shared.startLogging()
//#endif
