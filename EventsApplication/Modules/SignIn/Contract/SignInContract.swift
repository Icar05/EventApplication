//
//  SignInContract.swift
//  EventsApplication
//
//  Created by Eddson on 2/21/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

protocol SignInPresenter: class {
    var view: SignInView? { get set }
    var interactor: SignInInteractor! { get set }
    func onViewDidLoad()
}

protocol SignInInteractor: class {}

protocol SignInView: class {
    var presenter: SignInPresenter! { get set }
}
