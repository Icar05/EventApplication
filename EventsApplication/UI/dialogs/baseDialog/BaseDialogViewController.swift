//
//  BaseDialogViewController.swift
//  EventsApplication
//
//  Created by Eddson on 4/15/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class BaseDialogViewController: UIViewController {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = UIModalPresentationStyle.custom
        self.transitioningDelegate = self
    }
    
}


extension BaseDialogViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimatedController(withDuration: 0.5, forTransitionType: .Dismissing, originFrame: self.view.frame)
    }
    
    func animationController(forPresented presented: UIViewController,presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning?{
            return AnimatedController(withDuration: 0.5, forTransitionType: .Presenting, originFrame: self.view.frame)
    }
    
}
