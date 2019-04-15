
//
//  AnimationController.swift
//  EventsApplication
//
//  Created by Eddson on 4/15/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

enum TransitionType {
    case Presenting, Dismissing
}

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    var duration: TimeInterval
    var isPresenting: Bool
    var originFrame: CGRect
    
    init(withDuration duration: TimeInterval, forTransitionType type: TransitionType, originFrame: CGRect) {
        self.duration = duration
        self.isPresenting = type == .Presenting
        self.originFrame = originFrame
        
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!.view
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!.view
        
        let targetView = self.isPresenting ? toView : fromView
        
        
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        var scaleX = self.isPresenting ? 0.1 : 1.0
        var scaleY = self.isPresenting ? 0.1 : 1.0
        
        
        if( isPresenting){
            containerView.addSubview(targetView!)
        }
        
        
        targetView!.transform = CGAffineTransform(scaleX: CGFloat(scaleX), y: CGFloat(scaleY))
        targetView!.layoutIfNeeded()
        
        
        UIView.animate(withDuration: self.duration, animations: { () -> Void in
            scaleX = self.isPresenting ? 1.0 : 0.1
            scaleY = self.isPresenting ? 1.0 : 0.1
            targetView!.transform = CGAffineTransform(scaleX: CGFloat(scaleX), y: CGFloat(scaleY))
            
            
            
            targetView!.layoutIfNeeded()
            
            
        }) { (completed: Bool) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
