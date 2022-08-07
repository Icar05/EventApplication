//
//  SourcesPresenter.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift


public final class SourcesPresenter{
    
    
    
    private let showLog = false
    
    private let disposeBag = DisposeBag()
    
    private let repository: Repository
    
    private let interactor: SourcesInteractor
    
    private var category: String = ValueForSelector.categories[6]
    
    unowned var view: NewsVC!

    
    
    
    public func set(view: NewsVC) {
        self.view = view
    }
    
    init(interactor: SourcesInteractor, resository: Repository){
        self.interactor = interactor
        self.repository = resository
    }
    
    func viewDidLoad(){
        self.loadContent()
    }
    
    func getFreshContent(){
        self.loadContent()
    }
    
    func setCategory(category: String = ValueForSelector.categories[6]) {
        self.category = category
        self.getFreshContent()
    }
    
    func getCategory() -> String{
        return self.category
    }
    
    func clearCategory(){
        self.category = ValueForSelector.categories[6]
        self.loadContent()
    }
    
    private func loadContent(){
        self.view?.showLoading()
        
        self.interactor.getSourcesByCategory(category: category).asObservable()
            .map{ [weak self] sources  in
                self?.saveNews(sources: sources)
            }
            .map{ [weak self] result in
                self?.getSources() ?? []
            }
            .catchError{ [weak self] error in
                return Observable.just(self?.handleError(error: error) ?? [])
            }
            .subscribe(
                onNext: { [weak self] (articles) in
                    self?.handleArticles(sources: articles)
            })
            .disposed(by: disposeBag)
    }
    
    
    private func handleError(error: Error) -> [Sources]{
        self.view.handleError(error: error)
        return getSources()
    }
    
    private func handleArticles(sources: [Sources]){
        if(sources.count > 0){
            self.view.updateContent(cells: prepareCells(sources: sources))
        }else{
            self.view.showEmptyView()
        }
    }
    
    private func saveNews(sources: [Sources]) ->Bool{
        return self.repository.saveSources(sources: sources)
    }
    
    private func getSources() -> [Sources]{
        return self.repository.getSourcesByCategory(category: category)
    }
    
    private func prepareCells(sources: [Sources]) -> [CustomCellModel]{
        
        var cells: [CustomCellModel] = [NewsSeparatorCellModel()]
        sources.forEach{
                cells.append(SourcesCellModel(source: $0))
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

