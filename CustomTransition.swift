//
//  CustomTransition.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 4/13/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class CustomTransition: NSObject , UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromVC = transitionContext.viewController(forKey: .from) as? CustomTransictable,
            let toVC = transitionContext.viewController(forKey: .to) as? CustomTransictable,
            let snapshot = fromVC.mainView.snapshotView(afterScreenUpdates: false)
            else {
                transitionContext.completeTransition(false)
                return
           }
        
        
        let containerView = transitionContext.containerView
            containerView.addSubview(snapshot)
            fromVC.mainView.removeFromSuperview()
        
        animateOldTextOffscreen(fromView: snapshot)
            containerView.addSubview(toVC.mainView)
            animate(toView: toVC.mainView)

    }
    
    func animate(toView: UIView) {
        
    }
    
    func animateOldTextOffscreen(fromView: UIView) {
        // 1
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: [.curveEaseIn],
                       animations: {
                        // 2
                        fromView.center = CGPoint(x: fromView.center.x - 1300,
                                                  y: fromView.center.y + 1500)
                        // 3
                        fromView.transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        }, completion: nil)
    }
    

}
