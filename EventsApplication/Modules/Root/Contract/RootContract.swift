//
//  RootContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/26/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation

protocol RootPresenter: class {
    var view: RootView? { get set }
    var interactor: RootInteractor! { get set }
    func onViewDidLoad()
}

protocol RootInteractor: class {}

protocol RootView: class {
    var presenter: RootPresenter! { get set }
}
