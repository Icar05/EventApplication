//
//  CustomScrollView.swift
//  EventsApplication
//
//  Created by Eddson on 4/8/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit


@IBDesignable
class UIPicturedScrollView: UIScrollView {


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        setup()
    }
    
    
    func setup(){
        self.setBackground()
    }
    
    
    
    func setBackground(){
        let backgroundImage = UIImage(named: "back.png")
        self.backgroundColor = UIColor(patternImage: backgroundImage!)
    }


}
