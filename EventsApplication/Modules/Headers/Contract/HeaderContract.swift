//
//  HeaderContract.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation

protocol HeaderPresenter: class {
    var view: HeaderView? { get set }
    var interactor: HeadersInteractor! { get set }
    func onViewDidLoad()
}

protocol HeadersInteractor: class {}

protocol HeaderView: class {
    var presenter: HeaderPresenter! { get set }
}
