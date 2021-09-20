//
//  FollowersPresenter.swift
//
//  Created by José Martins on 22/03/2021.
//

import Foundation

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol FollowersPresenterDelegate: BasePresenterDelegate {
    func dataLoaded()
}

//-----------------------------------------------------------------------
//  MARK: - Presenter
//-----------------------------------------------------------------------

final class FollowersPresenter: BasePresenter<FollowersRouter, FollowersManager, FollowersViewController> {
    
    private var delegate: FollowersPresenterDelegate
    
    private(set) var followers: [Follower] = []
    
    init (delegate: FollowersPresenterDelegate, router: FollowersRouter, manager: FollowersManager) {
        self.delegate = delegate
        
        super.init(router: router, manager: manager)
    }
    
    func loadData() {
        if let gitHubUser = Session.get()?.login {
            
            delegate.loading(true)
            
            self.manager.loadFollowers(gitHubUser: gitHubUser) { (response, error) in
                self.delegate.loading(false)
                
                if let response = response {
                    self.followers = response
                    self.delegate.dataLoaded()
                    return
                }
                
                if let error = error {
                    self.delegate.alert(error.message, .error)
                    return
                }
                
                self.delegate.alert(Constants.Message.FollowerLoadError, .error)
            }
        }
    }
}
