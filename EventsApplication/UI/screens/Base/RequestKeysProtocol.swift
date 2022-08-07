//
//  RequestKeysProtocol.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/04/03.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit


protocol TabItem {
    func getRightNavBarButton() -> UIBarButtonItem?
    func getLeftNavBarButton() -> UIBarButtonItem?
}
extension TabItem{
    func createNavItem(title: String, selector: String) -> UIBarButtonItem{
        return UIBarButtonItem(title: title, style: .plain, target: self,
                               action: Selector((selector)))
    }
}
