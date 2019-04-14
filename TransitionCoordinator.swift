//
//  TransitionCoordinator.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 4/13/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class TransitionCoordinator: NSObject, UINavigationControllerDelegate {

    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        return CustomTransition()
    }
    
}
