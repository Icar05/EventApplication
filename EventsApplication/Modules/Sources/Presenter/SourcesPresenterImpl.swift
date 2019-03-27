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
        NetworkServiceRx.shared
            .getSourcesByCategory(category: category)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (sources) in
//                    self.debug(value: "-------------- On NEXT ")
//                    self.debugSources(sources: sources)
            }, onError: { (error) in
//                self.debug(value: "-------------- On onError \(error.localizedDescription)")
            }, onCompleted: {
//                self.debug(value: "-------------- On onCompleted ")
            }, onDisposed: {
//                self.debug(value: "-------------- On onDisposed ")
            }).disposed(by: disposeBag)
    }
    
}
