//
//  EmptyView.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class EmptyView: UIView {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var blurView: UIVisualEffectView?
    
    //    @IBInspectable var color: UIColor = UIColor.orange
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func showLoading(){
        self.isHidden = false
        loading.isHidden = false
        loading.startAnimating()
        label.isHidden = true
    }
    
    func hideLoading(){
        self.isHidden = true
    }
    
    
    func showEmptyView(){
        self.isHidden = false
        loading.stopAnimating()
        loading.isHidden = true
        label.isHidden = false
    }
    
    
    func showError(value: String){
        self.isHidden = false
        loading.stopAnimating()
        loading.isHidden = true
        label.isHidden = false
        label.text = value
    }
    
    
    func setup() {
        
        let bundle = Bundle(for: EmptyView.self)
        bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask =
            [UIView.AutoresizingMask.flexibleWidth,
             UIView.AutoresizingMask.flexibleHeight]
        
        setBlur()
        //        label.textColor = color
        //        loading.color = color
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
        blurEffectView.frame = self.bounds
        
        
        blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(4.0).cgColor
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        blurEffectView.clipsToBounds = true;
        blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        blurEffectView.layer.borderWidth = 4.0;
        blurEffectView.layer.cornerRadius = 6.0;
        
        return blurEffectView
    }

}
