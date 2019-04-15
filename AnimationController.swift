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

        if self.isPresenting {
            containerView.addSubview(toView!)
        }

        targetView!.frame.origin = self.isPresenting ? self.originFrame.origin : CGPoint(x: 0, y: 0)
        targetView!.frame.size.width = self.isPresenting ? self.originFrame.size.width : containerView.bounds.width
        targetView!.layoutIfNeeded()

        for view in targetView!.subviews {
                view.alpha = isPresenting ? 0.0 : 1.0
        }

        UIView.animate(withDuration: self.duration, animations: { () -> Void in
            targetView!.frame = self.isPresenting ? containerView.bounds : self.originFrame
            targetView!.layoutIfNeeded()

            for view in targetView!.subviews {
                    view.alpha = self.isPresenting ? 1.0 : 0.0
            }
        }) { (completed: Bool) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
