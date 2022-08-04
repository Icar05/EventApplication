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
     
     let category : String? green
     let url : String?
 
     let language : String?
     let country : String?
     */
    private func prepareCells(sources: Sources) -> [DetailModel]{
        
        return [
//            DetailDescriptionCellModel(description: sources.category ?? ""),
            DetailTitleCellModel(title: sources.name ?? ""),
            DetailDescriptionCellModel(description: sources.description ?? ""),
//            DetailImageCellModel(image: article.urlToImage),
//            DetailTitleCellModel(title: article.title!),
            
//            DetailUrlCellModel(url: article.url ?? ""),
//            DetailAuthorCellModel(
//                author: article.author,
//                date: DateTimeUtil.convertDateString(
//                    dateString: article.publishedAt
//                )
//            )
        ]
        
    }
    
}
