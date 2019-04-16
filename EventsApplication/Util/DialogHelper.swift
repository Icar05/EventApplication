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
        let alert = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: error.localizedDescription,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
