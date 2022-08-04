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
    
    private func prepareCells(article: Articles) -> [DetailModel]{
        return [
            DetailImageCellModel(image: article.urlToImage),
            DetailTransparentCellModel(text: article.title!),
            DetailAccentCellModel(text: article.description ?? ""),
            DetailUrlCellModel(url: article.url ?? ""),
            DetailAuthorCellModel(
                author: article.author,
                date: DateTimeUtil.convertDateString(
                    dateString: article.publishedAt
                )
            )
        ]
    }
    
}
