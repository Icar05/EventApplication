//
//  EverythingContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift


protocol EverythingPresenter: class {
    var view: EverythingView? { get set }
    var interactor: EverythingInteractor! { get set }
    func onViewDidLoad()
    
    func getEverythingByQuery(query: String)
    
    func getEverythingByLanguage(query: String, language: String)
    
}

protocol EverythingInteractor: class {
    
    func getEverythingByQuery(query: String) -> Observable<[Articles]>
   
    func getEverythingByLanguage(query: String, language: String) -> Observable<[Articles]>
    
}

protocol EverythingView: class {
    var presenter: EverythingPresenter! { get set }
}

