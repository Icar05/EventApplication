//
//  AuthUtil.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/25.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import LocalAuthentication

class AuthUtil {
    
    
    
    let context = LAContext()
    
    var error: NSError?
    
    
    
    func startAuth(){
        
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//                let reason = "Identify yourself!"
//
//                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
//                        [unowned self] (success, authenticationError) in
//
//                        DispatchQueue.main.async {
//                            if success {
//                                print("Success !!!! ")
//                            } else {
//                                print("Error  !!!!")
//                            }
//                        }
//                    }
//                } else {
//                    // no biometry
//                }
    }
    
}
