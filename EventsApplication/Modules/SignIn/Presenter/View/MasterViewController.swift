//
//  MasterControllerViewController.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MasterViewController: UIViewController {

    
    var presenter: MasterPresenter!
    
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var searchCityTF: UITextField!
    
    @IBAction func goToDetail() {
        Router.presentDetailScreen(current: self, city: (searchCityTF?.text)!.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    @IBOutlet weak var searchbtn: UIButton!
    

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        hideKeyboardWhenTappedAround()
        subscribeRxChanges()
        
    }
    
    private func subscribeRxChanges(){
        
        searchCityTF.rx.text.subscribe(onNext:{ text in
            
            if((text?.count)! > 0){
                self.searchbtn.isEnabled = true
                self.searchbtn.alpha = 1.0
            }else{
                self.searchbtn.isEnabled = false
                self.searchbtn.alpha = 0.5
            }
            
        }).disposed(by: disposeBag)
    }
}


extension MasterViewController : MasterView{
    
    
    func showWeather(_ data: [RootClass]) {
        for model: RootClass in data{
            print("data "+model.city.country)
        }
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
