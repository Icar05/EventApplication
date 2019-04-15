//
//  CustomScrollView.swift
//  EventsApplication
//
//  Created by Eddson on 4/8/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit


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
        self.backgroundColor = UIColor(patternImage: .applicationBackground)
    }


}
