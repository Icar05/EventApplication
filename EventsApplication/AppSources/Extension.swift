//
//  Extension.swift
//  EventsApplication
//
//  Created by Eddson on 4/11/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    static let applicationBackground = UIImage(named: "back.png")!
    static let defaultImage = UIImage(named: "thumb")!
    static let tabIcon = UIImage(named: "news")
}

extension UIColor {
    
    static let accentColor = UIColor(named: "Accent")
    static let appGrayColor = UIColor(named: "ApplicationGray")
    static let urlColor = UIColor(named: "Url")
}

extension UIImageView  {
    func downloadImageFrom(link:String?, contentMode: UIView.ContentMode)-> URLSessionDataTask? {
        
        if let current = link, let url = URL(string: current){
            let task: URLSessionDataTask = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: {
                (data, response, error) -> Void in
                
                DispatchQueue.main.async {
                    self.contentMode =  contentMode
                    if let data = data, let image = UIImage(data: data) {
                        self.image = image
                    }else{
                        self.image = .defaultImage
                    }
                }
            })
            
                task.resume()
            
            return task
        }
        
        return nil
    }

}

extension UIViewController {
    func getApplication() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
}
