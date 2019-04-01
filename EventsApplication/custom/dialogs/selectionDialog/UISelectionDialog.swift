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
    
   
    
    typealias selectDialogComplateion = (String)->Void
    var completion: selectDialogComplateion?
    
    @IBAction func cancelClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func okClick(_ sender: UIButton) {
        self.completion?(value == "" ? pickerDataSource[0] : value)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var pickerDataSource: [String] = []
    var value: String = ""
    
    
    func setDatasource(value: [String]){
        self.pickerDataSource = value
    }
    
    func setCompletion(completion: @escaping selectDialogComplateion){
        self.completion = completion
    }
    
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
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.value = pickerDataSource[row]
        print("picker : \(pickerDataSource[row])")
    }
   
    
}
