//
//  EverythingContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation


protocol EverythingPresenter: class {
    var view: EverythingView? { get set }
    var interactor: EverythingInteractor! { get set }
    func onViewDidLoad()
}

protocol EverythingInteractor: class {}

protocol EverythingView: class {
    var presenter: EverythingPresenter! { get set }
}

