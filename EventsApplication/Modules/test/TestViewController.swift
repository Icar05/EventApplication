//
//  TestViewController.swift
//  EventsApplication
//
//  Created by Eddson on 4/8/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.setBackground()
//        self.test()
    }

    
    func setBackground(){
        let imageName = "back.png"
        
        let backgroundImage = UIImage(named: imageName)
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        
            backgroundImageView.image = backgroundImage
            backgroundImageView.contentMode = .scaleAspectFill
        
    
        
        self.testLabel.text = "lorem ipsum long test"
        self.testLabel.textColor = UIColor.black

        
        self.view.insertSubview(backgroundImageView, at: 0)
//        self.addBlurEffect(input: testLabel)
    }
    
    
 
    
    func addBlurEffect(input: UIView){
        
    
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = input.bounds
        
        
            blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(4.0).cgColor
            blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
            blurEffectView.clipsToBounds = true;
            blurEffectView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
            blurEffectView.layer.borderWidth = 4.0;
            blurEffectView.layer.cornerRadius = 6.0;


            input.backgroundColor = .clear
            input.addSubview(blurEffectView)
    }

}
extension TestViewController : TabItem{
    func getNavBarButtons() -> [UIBarButtonItem?] {
        return [nil, nil]
    }
}
