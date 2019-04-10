//
//  CStackView.swift
//  EventsApplication
//
//  Created by Eddson on 4/10/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class UIBluredStackView: UIStackView {

    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        setup()
    }
    
    
    func setup(){
        self.backgroundColor = .clear
        self.blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(4.0).cgColor
        self.blurEffectView.layer.borderWidth = 2.0;
        self.insertSubview(blurEffectView, at: 0)
    }
    
    override var bounds: CGRect{
        didSet{
            self.blurEffectView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    override func layoutSubviews() {
        self.blurEffectView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    

    

}
