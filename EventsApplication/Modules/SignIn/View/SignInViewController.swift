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
        test()
    }
    
    
    func test(){
//         MockNetworkTester().testGetDefaultHeadlines()
//         MockNetworkTester().testGetHeadlinesByCountry(country: "ua")
//         MockNetworkTester().testGetHeadlinesByCategory(category: ValueForSelector().categories[0])
//         MockNetworkTester().testtGetEverythingByQuery(query: "Порошенко")
//         MockNetworkTester().testGetEverythingByLanguage(query: "Apple iOS" , language: "en")
//         MockNetworkTester().testGetSourcesByCategory(category: ValueForSelector().categories[0])
    }
    
}
extension SignInViewController : SignInView{
   
}
