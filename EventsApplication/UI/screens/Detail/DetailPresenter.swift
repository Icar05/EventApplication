//
//  DetailPresenter.swift
//  EventsApplication
//
//  Created by ICoon on 03.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

public final class DetailPresenter{
    
    
    private let article: Articles
    
    unowned var view: DetailViewController!

    
    public func set(view: DetailViewController) {
        self.view = view
    }
    
    init(article: Articles){
        self.article = article
    }
    
    func viewDidLoad(){
        self.view.registerCells(models: prepareCells(article: article))
    }
    
    
    /**
     self.date.text = DateTimeUtil.convertDateString(dateString: article?.publishedAt)
     self.autor.text = article?.author
     self.prepareUrl()
     */
    private func prepareCells(article: Articles) -> [DetailModel]{
        
        return [
            DetailImageCellModel(image: article.urlToImage),
            DetailTitleCellModel(title: article.title!),
            DetailDescriptionCellModel(description: article.description ?? ""),
            DetailUrlCellModel(url: article.url ?? "")
        ]
        
    }
    
}