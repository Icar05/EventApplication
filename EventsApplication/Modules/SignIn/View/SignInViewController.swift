//
//  SignInViewController.swift
//  EventsApplication
//
//  Created by Eddson on 2/21/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit
import LocalAuthentication

class SignInViewController: UIViewController {
    
    
    
    var presenter: SignInPresenter!
    
    let context = LAContext()
    
    var error: NSError?

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAuth()
    }
    
    

    
    
    func startAuth(){
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] (success, authenticationError) in
                
                DispatchQueue.main.async {
                    if success {
                        print("Success !!!!")
                        
                        MockNetworkTester().testSearchEventByKeyword()
                    } else {
                        print("Error  !!!!")
                    }
                }
            }
        } else {
            // no biometry
        }
    }
    
}
extension SignInViewController : SignInView{
   
}
