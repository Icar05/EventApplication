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
    
    unowned var view: WorldNewsViewController!

    
    
    
    public func set(view: WorldNewsViewController) {
        self.view = view
    }
    
    init(interactor: EverythingInteractor, resository: Repository){
        self.interactor = interactor
        self.repository = resository
    }
    
    func viewDidLoad(){
        self.loadContent(
            onEnd: { models in
                self.view?.registerCells(models: models)
            })
    }
    
    func getFreshContent(){
        self.loadContent(
            onEnd: { models in
                self.view?.refreshCells(models: models)
            })
    }
    
    func setQuery(query: String = ValueForSelector.defaultQuery) {
        self.getFreshContent()
    }
    
    private func loadContent(onEnd:  @escaping (_ models: [CustomCellModel]) -> Void){
        
            self.view?.showLoading()
            self.interactor.getEverythingByQuery(query: query).asObservable()
            .map{ [weak self] articles  in
                let result = self?.repository.saveArticles(articles: articles)
                self?.printLog("Repository input count -> \(articles.count), result of save \(String(describing: result))")
            }
            .map{ [weak self] result in
                self?.getWorldNews()
            }
            .catchError{ [weak self] error in
                
                if let view = self?.view{
                    view.handleError(error: error)
                }
                
                self?.printLog("Repository error ->  \(error.localizedDescription)")
                return Observable.just(self?.getWorldNews())
            }
            .subscribe(
                onNext: { [weak self] (articles) in
                    
                    self?.printLog("Repository hide loading")
                    
                    if let view: WorldNewsViewController = self?.view, let article = articles, let s = self{
                        let content = s.prepareCells(article: article)
                        view.hideLoading()
                        onEnd(content)
                    }
                    
            }).disposed(by: disposeBag)
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

