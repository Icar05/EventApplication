//
//  RequestKeysProtocol.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/04/03.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit


protocol TabItem {
    func getNavBarButtons() -> [UIBarButtonItem?]
}
extension TabItem{
    func createNavItem(title: String, selector: String) -> UIBarButtonItem{
        return UIBarButtonItem(title: title, style: .plain, target: self,
                               action: Selector((selector)))
    }
    
    func setBackground(vc: UIViewController){
        let imageName = "back.png"
        
        let backgroundImage = UIImage(named: imageName)
        let backgroundImageView = UIImageView.init(frame: vc.view.frame)
        
            backgroundImageView.image = backgroundImage
            backgroundImageView.contentMode = .scaleAspectFill
        
        vc.view.insertSubview(backgroundImageView, at: 0)
    }
}
