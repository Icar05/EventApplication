//
//  SourcesPresenterImpl.swift
//  EventsApplication
//
//  Created by Eddson on 3/27/19.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

class SourcesPresenterImpl {
    
    
    
    let disposeBag = DisposeBag()
    var view: SourcesView?
    var category: String = ValueForSelector.categories[6]
    var interactor: SourcesInteractor!
    let repository = RepositoryImpl.shared
    
    func onViewDidLoad() {
        getSourcesByCategory(category: category)
        print("presenter refersh -> Sources presenter reload!")
    }
    
    
}
extension SourcesPresenterImpl: SourcesPresenter{
    
    
    func setCategory(category: String) {
        self.category = category
        self.getSourcesByCategory(category: category)
    }
    
    
    
   
    
    func getSourcesByCategory(category: String) {
        self.view?.showLoading()
        self.interactor.getSourcesByCategory(category: category).asObservable()
            .map{ sources  in
                self.repository.saveSources(sources: sources)
            }
            .map{ result in
                self.repository.getSourcesByCategory(category: category)
            }
            .catchError{ error in
                self.view?.handleError(error: error)
                print("Repository error ->  \(error.localizedDescription)")
                
                return Observable.just(self.repository.getSourcesByCategory(category: category))
            }
            .subscribe(
                onNext: { (sources) in
                    print("Repository hide loading")
                    self.view?.hideLoading()
                    self.view?.updateTableView(sources: sources)
            }).disposed(by: disposeBag)
    }
    
}
