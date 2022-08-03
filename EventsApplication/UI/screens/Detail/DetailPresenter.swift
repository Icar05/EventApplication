//
//  DetailPresenter.swift
//  EventsApplication
//
//  Created by ICoon on 03.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

public final class DetailPresenter{
    
    
    private let article: Article
    
    unowned var view: DetailViewController!

    
    public func set(view: DetailViewController) {
        self.view = view
    }
    
    init(article: Article){
        self.article = article
    }
    
    func viewDidLoad(){
        self.view.displayArticle(article: article)
    }
    
}
