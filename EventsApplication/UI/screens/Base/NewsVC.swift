//
//  NewsVC.swift
//  EventsApplication
//
//  Created by ICoon on 06.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

public protocol NewsVC: NSObject{
        
    func showLoading()

    func showEmptyView()

    func handleError(error: Error)

    func updateContent(cells: [CustomCellModel])
}

