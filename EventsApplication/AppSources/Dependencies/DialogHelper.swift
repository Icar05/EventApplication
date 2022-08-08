//
//  DialogHelper.swift
//  EventsApplication
//
//  Created by Ipinguin_linuxoid on 2019/03/28.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

class DialogHelper {
    
    static func presentErrorDialog(error: Error, viewController: UIViewController){
        let alert = UIAlertController(title: Translations.General.Error, message: error.localizedDescription,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Translations.Dialog.ok, style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
