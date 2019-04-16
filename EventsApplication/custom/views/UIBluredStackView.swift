//
//  CStackView.swift
//  EventsApplication
//
//  Created by Eddson on 4/10/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class UIBluredStackView: UIStackView {

    
    let backgroundView = UIView()
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        setup()
    }
    
    
    func setup(){
        self.backgroundView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        self.insertSubview(backgroundView, at: 0)
    }
    
    override var bounds: CGRect{
        didSet{
            self.backgroundView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        }
    }

    override func layoutSubviews() {
            self.backgroundView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    

    

}
