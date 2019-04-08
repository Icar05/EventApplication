//
//  CustomScrollView.swift
//  EventsApplication
//
//  Created by Eddson on 4/8/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class CustomScrollView: UIScrollView {

  
    override func didAddSubview(_ subview: UIView) {
        
        self.setBackground()
        self.setBlur()
    }
    
    
    var blurView: UIVisualEffectView?
    
    
    func setBackground(){
        let imageName = "back.png"
        
        let backgroundImage = UIImage(named: imageName)
        self.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
    
    
    
    func setBlur(){
        
        if(blurView == nil){
            self.backgroundColor = .clear
            self.blurView = getBlurView()
            self.insertSubview(self.blurView!, at: 0)
        }
    }
    
    func getBlurView() -> UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.frame
        
        
            blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(4.0).cgColor
            blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
            blurEffectView.clipsToBounds = true;
            blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
            blurEffectView.layer.borderWidth = 4.0;
            blurEffectView.layer.cornerRadius = 6.0;
        
        return blurEffectView
    }
    
}
