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
    
    unowned var view: SourcesViewController!

    
    
    
    public func set(view: SourcesViewController) {
        self.view = view
    }
    
    init(interactor: SourcesInteractor, resository: Repository){
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
    
    func setCategory(category: String = ValueForSelector.categories[6]) {
        self.category = category
        self.getFreshContent()
    }
    
    private func loadContent(onEnd:  @escaping (_ models: [CustomCellModel]) -> Void){
        
            self.view?.showLoading()
            self.interactor.getSourcesByCategory(category: category)
            .map{ [weak self] sources  in
                let result = self?.repository.saveSources(sources: sources)
                self?.printLog("Repository input count -> \(sources.count), result of save \(String(describing: result))")
            }
            .map{ [weak self] result in
                self?.getSources()
            }
            .catchError{ [weak self] error in
                
                if let view = self?.view{
                    view.handleError(error: error)
                }
                
                self?.printLog("Repository error ->  \(error.localizedDescription)")
                return Observable.just(self?.getSources())
            }
            .subscribe(
                onNext: { [weak self] (sources) in
                    
                    self?.printLog("Repository hide loading")
                    
                    if let view: SourcesViewController = self?.view, let sources = sources, let s = self{
                        let content = s.prepareCells(sources: sources)
                        view.hideLoading()
                        onEnd(content)
                    }
                    
            }).disposed(by: disposeBag)
    }
    
    private func getSources() -> [Sources]{
        return self.repository.getSourcesByCategory(category: category)
    }
    
    private func prepareCells(sources: [Sources]) -> [CustomCellModel]{
        
//        var cells: [CustomCellModel] = [NewsSeparatorCellModel()]
//            article.forEach{
//                cells.append(NewsCellModel(article: $0))
//                cells.append(NewsSeparatorCellModel())
//            }
//
//       return cells
        
        return []
    }
    
    private func printLog(_ value: String){
        if(showLog){
            print(value)
        }
    }
    
}

