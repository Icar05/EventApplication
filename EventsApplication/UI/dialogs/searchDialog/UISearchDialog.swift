//
//  UISearchDialog.swift
//  EventsApplication
//
//  Created by Eddson on 4/1/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

struct UISearchDialogModel{
    let title: String
    let subtitle: String
    let hint: String
    var completion: ((String)->Void)?
}


class UISearchDialog: BaseDialogViewController{
    
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var dialogTitle: UILabel!
    
    @IBOutlet weak var dialogSubtitle: UILabel!
    
    @IBOutlet weak var searchField: UITextField!
    
    private var model: UISearchDialogModel? = nil

    
    
    @IBAction func cancelClick(_ sender: UIButton) {
        self.model?.completion = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okClick(_ sender: UIButton) {
        self.model?.completion?(getResult())
        self.model?.completion = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    private func getResult() -> String{
        if let result = self.searchField.text, !result.isEmpty{
            return result
        }
        
        return self.model!.hint
    }
    
    func setModel(model: UISearchDialogModel){
        self.model = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
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
        self.dialogTitle.text = model?.title
        self.dialogSubtitle.text = model?.subtitle
        self.searchField.text = model?.hint
    }
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
    

    

