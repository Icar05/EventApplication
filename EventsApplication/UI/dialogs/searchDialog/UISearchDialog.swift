//
//  UISearchDialog.swift
//  EventsApplication
//
//  Created by Eddson on 4/1/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class UISearchDialog: BaseDialogViewController{
    
    
    @IBOutlet weak var dialogTitle: UILabel!
    
    @IBOutlet weak var dialogSubtitle: UILabel!
    
    @IBOutlet weak var searchField: UITextField!
    
    var customTitle: String?
    
    var customDescription: String?
    
    
    @IBAction func cancelClick(_ sender: UIButton) {
        self.completion = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okClick(_ sender: UIButton) {
        self.completion?(self.searchField.text ?? "")
        self.completion = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var alertView: UIView!
    
    
    
    typealias searchDialogComplateion = (String)->Void
    var completion: searchDialogComplateion?
    
    
    func setDescription(title: String, subtitle: String){
        self.dialogTitle.text = title
        self.dialogSubtitle.text = subtitle
    }
    
    func setCompletion(completion: @escaping searchDialogComplateion){
        self.completion = completion
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
        self.dialogTitle.text = customTitle
        self.dialogSubtitle.text = customDescription
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
    

    

