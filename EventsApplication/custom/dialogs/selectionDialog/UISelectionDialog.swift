//
//  UISelectionDialog.swift
//  EventsApplication
//
//  Created by Eddson on 4/1/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class UISelectionDialog: UIViewController {
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var dialogTitle: UILabel!
    
    @IBOutlet weak var dialogSubtitle: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var okBtn: UIButton!
    
    let pickerDataSource = ["business", "entertainment", "general", "health", "science", "sports", "technology" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
//        cancelBtn.addBorder(side: .Top, color: alertViewGrayColor, width: 1)
//        cancelButton.addBorder(side: .Right, color: alertViewGrayColor, width: 1)
//        okButton.addBorder(side: .Top, color: alertViewGrayColor, width: 1)
    }
    
    func setupView() {
        self.alertView.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
    }
    
    func animateView() {
        self.alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0;
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
    
//    @IBAction func onTapCancelButton(_ sender: Any) {
//        alertTextField.resignFirstResponder()
//        delegate?.cancelButtonTapped()
//        self.dismiss(animated: true, completion: nil)
//    }
    
//    @IBAction func onTapOkButton(_ sender: Any) {
//        alertTextField.resignFirstResponder()
//        delegate?.okButtonTapped(selectedOption: selectedOption, textFieldValue: alertTextField.text!)
//        self.dismiss(animated: true, completion: nil)
//    }
    
//    @IBAction func onTapSegmentedControl(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            print("First option")
//            selectedOption = "First"
//            break
//        case 1:
//            print("Second option")
//            selectedOption = "Second"
//            break
//        default:
//            break
//        }
//    }
    
}


extension UISelectionDialog : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->  String? {
        return pickerDataSource[row]
    }
    
    func pickerView( pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("picker : \(pickerDataSource[row])")
    }
   
    
}
