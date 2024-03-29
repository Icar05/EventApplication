//
//  AppComponent.swift
//  EventsApplication
//
//  Created by ICoon on 05.08.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//

import Foundation

class AppComponent{
    
    private let repository: Repository
    
    private let headerInteractor: HeadersInteractor
    
    private let everythingInteractor: EverythingInteractor
    
    private let sourceInteractor: SourcesInteractor
    
    
    init(){
        self.repository = RepositoryImpl()
        self.headerInteractor = HeadersInteractor(repository: repository)
        self.everythingInteractor = EverythingInteractor(repository: repository)
        self.sourceInteractor = SourcesInteractor(repository: repository)
    }
    
    
    func getRepository() -> Repository{
        return self.repository
    }
    
    func getHeaderInteractor() -> HeadersInteractor{
        return self.headerInteractor
    }
    
    func getEverythingInteractor() -> EverythingInteractor{
        return self.everythingInteractor
    }
    
    func getSourcesInteractor() -> SourcesInteractor{
        return self.sourceInteractor
    }
    
}
