//
//  BaseCellTableViewCell.swift
//  EventsApplication
//
//  Created by Eddson on 4/8/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {

    var blurView: UIVisualEffectView?
    
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
            blurEffectView.frame = self.bounds
    
            blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(4.0).cgColor
            blurEffectView.layer.borderWidth = 4.0;
//            blurEffectView.layer.cornerRadius = 6.0;
        
        
        
        return blurEffectView
    }

}
