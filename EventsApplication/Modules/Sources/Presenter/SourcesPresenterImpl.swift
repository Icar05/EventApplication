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
    
    var interactor: SourcesInteractor!
    
    func onViewDidLoad() {
        
    }
}
extension SourcesPresenterImpl: SourcesPresenter{
    
    func getSourcesByCategory(category: String) {
        self.interactor
            .getSourcesByCategory(category: category)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (sources) in
                self.view?.updateTableView(sources: sources)
            }, onError: { (error) in
                self.view?.handleError(error: error)
            }).disposed(by: disposeBag)
    }
    
}
