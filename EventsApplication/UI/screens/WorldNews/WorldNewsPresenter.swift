//
//  WorldNewsPresenter.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

public final class WorldNewsPresenter{
    
    
    
    private let showLog = false
    
    private let disposeBag = DisposeBag()
    
    private let repository: Repository
    
    private let interactor: EverythingInteractor
    
    private var query: String = ValueForSelector.defaultQuery
    
    unowned var view: NewsVC!

    
    
    
    public func set(view: NewsVC) {
        self.view = view
    }
    
    init(interactor: EverythingInteractor, resository: Repository){
        self.interactor = interactor
        self.repository = resository
    }
    
    func viewDidLoad(){
        self.loadContent()
    }
    
    func getFreshContent(){
        self.loadContent()
    }
    
    func setQuery(query: String = ValueForSelector.defaultQuery) {
        self.query = query
        self.getFreshContent()
    }
    
    func getQuery() -> String{
        return self.query
    }
    
    private func loadContent(){
        self.view?.showLoading()
        
        self.interactor.getEverythingByQuery(query: query).asObservable()
            .map{ [weak self] articles  in
                self?.saveNews(articles: articles)
            }
            .map{ [weak self] result in
                self?.getWorldNews() ?? []
            }
            .catchError{ [weak self] error in
                return Observable.just(self?.handleError(error: error) ?? [])
            }
            .subscribe(
                onNext: { [weak self] (articles) in
                    self?.handleArticles(arcicles: articles)
            })
            .disposed(by: disposeBag)
    }
    
    private func handleError(error: Error) -> [Articles]{
        self.view.handleError(error: error)
        return getWorldNews()
    }
    
    private func handleArticles(arcicles: [Articles]){
        if(arcicles.count > 0){
            self.view.updateContent(cells: prepareCells(article: arcicles))
        }else{
            self.view.showEmptyView()
        }
    }
    
    private func saveNews(articles: [Articles]) ->Bool{
        return self.repository.saveArticles(articles: articles)
    }
    
    private func getWorldNews() -> [Articles]{
        return self.repository.getEverything(query: query)
    }
    
    private func prepareCells(article: [Articles]) -> [CustomCellModel]{
        
        var cells: [CustomCellModel] = [NewsSeparatorCellModel()]
            article.forEach{
                cells.append(NewsCellModel(article: $0))
                cells.append(NewsSeparatorCellModel())
            }
        
       return cells
    }
    
    private func printLog(_ value: String){
        if(showLog){
            print(value)
        }
    }
    
}

