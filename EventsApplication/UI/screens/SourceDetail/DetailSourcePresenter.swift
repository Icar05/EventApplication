//
//  DetailSourcePresenter.swift
//  EventsApplication
//
//  Created by ICoon on 04.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation


public final class DetailSourcePresenter{
    
    
    private let sources: Sources
    
    unowned var view: DetailSourceViewController!
    
    
    public func set(view: DetailSourceViewController) {
        self.view = view
    }
    
    init(sources: Sources){
        self.sources = sources
    }
    
    func viewDidLoad(){
        self.view.registerCells(models: prepareCells(sources: sources))
    }
    
    
    /**
     let name : String?
     let description : String?
     let url : String?
     let category : String?
     let language : String?
     let country : String?
     */
    private func prepareCells(sources: Sources) -> [CustomCellModel]{
        
        return [
            DetailTransparentCellModel(text: sources.name ?? ""),
            DetailAccentCellModel(text: sources.description ?? ""),
            DetailUrlCellModel(url: sources.url),
            DetailAuthorCellModel(
                author: NSLocalizedString(sources.country!, comment: ""),
                date: "\(NSLocalizedString("Language", comment: "")) : \(sources.language!)"),
            DetailCategoryCellModel(category: sources.category ?? "")
        ]
        
    }
    
}
