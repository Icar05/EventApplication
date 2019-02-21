//
//  SignInViewController.swift
//  EventsApplication
//
//  Created by Eddson on 2/21/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var presenter: SignInPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension SignInViewController : SignInView{
   
}
