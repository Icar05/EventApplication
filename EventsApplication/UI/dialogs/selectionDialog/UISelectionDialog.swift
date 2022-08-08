//
//  UISelectionDialog.swift
//  EventsApplication
//
//  Created by Eddson on 4/1/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

struct UISelectionDialogModel{
    let title: String
    let subtitle: String
    let dataSourse: [String]
    let currentSelection: String
    var completion: ((String)->Void)?
}

class UISelectionDialog: BaseDialogViewController {
    
    
    @IBOutlet weak var okBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var dialogTitle: UILabel!
    
    @IBOutlet weak var dialogSubtitle: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func cancelClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okClick(_ sender: UIButton) {
        self.model?.completion?(getResult())
        self.dismiss(animated: true, completion: nil)
    }
    
    private var model: UISelectionDialogModel? = nil
    
    private var value: String = ""
    
    
    func setModel(model: UISelectionDialogModel){
        self.model = model
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
    
    
    func setupView() {
        self.alertView.layer.cornerRadius = 10
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.dialogTitle.text = model?.title
        self.dialogSubtitle.text = model?.subtitle
        self.setCurrentSelection()
        self.cancelBtn.setTitle(Translations.Dialog.cancel,  for: .normal)
        self.okBtn.setTitle(Translations.Dialog.ok,  for: .normal)
    }
    
    private func setCurrentSelection(){
        
        if let selection = model?.currentSelection,
           let id = model?.dataSourse.firstIndex(of: selection){
            self.pickerView.selectRow(id, inComponent: 0, animated: true)
            self.value = selection
        }
    }
    
    private func getResult() -> String{
        if(value.isEmpty){
            return (self.model?.dataSourse.first)!
        }
        
        return value
    }
    
}


extension UISelectionDialog : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (model?.dataSourse.count)!
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->  String? {
        return NSLocalizedString((model?.dataSourse[row])!, comment: "")
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.value = (model?.dataSourse[row])!
        print("picker : \(String(describing: model?.dataSourse[row]))")
    }
   
    
}
