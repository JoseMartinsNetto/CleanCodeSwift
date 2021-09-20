//
//  RepositoriesPresenter.swift
//
//  Created by José Martins on 24/03/2021.
//

import Foundation

//  MARK: - Presenter Delegate

protocol RepositoriesPresenterDelegate: BasePresenterDelegate {
    func dataLoaded()
}

//  MARK: - Presenter

class RepositoriesPresenter: BasePresenter< RepositoriesRouter, RepositoriesManager, RepositoriesViewController> {
    
    var delegate: RepositoriesPresenterDelegate
    
    private(set) var repositories: [Repository] = []
    
    init (delegate: RepositoriesPresenterDelegate, router: RepositoriesRouter, manager: RepositoriesManager) {
        self.delegate = delegate
        
        super.init(router: router, manager: manager)
    }
    
    func loadData() {
        if let user = Session.get()?.login {
            delegate.loading(true)
            self.manager.loadData(gitHubUser: user) { (response, error) in
                
                self.delegate.loading(false)
                
                if let repositories = response {
                    self.repositories = repositories
                    self.delegate.dataLoaded()
                    return
                }
                
                if let error = error {
                    self.delegate.alert(error.message, .error)
                    return
                }
                
                self.delegate.alert(Constants.Message.ReposLoadError, .error)
            }
        }
    }
}
