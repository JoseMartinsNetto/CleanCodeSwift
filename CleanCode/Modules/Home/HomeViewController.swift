//
//  HomeViewController.swift
//
//  Created by José Martins on 22/03/2021.
//

import UIKit

final class HomeViewController: BaseViewController,
                          HomePresenterDelegate {
    
    var presenter: HomePresenter!
    
    @IBOutlet private var vwRepoCard: UIView!
    @IBOutlet private var vwFollowersCard: UIView!
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func configUI() {
        super.configUI()
        
        setupGuestures()
    }
    
    override func loadUI() { }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate
    //-----------------------------------------------------------------------
    
    func dataLoaded() { }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------
    
    private func setupGuestures() {
        let tapOnRepositories = UITapGestureRecognizer(target: self, action: #selector(handleTapOnRepositories))
        let tapOnFollowers = UITapGestureRecognizer(target: self, action: #selector(handleTapOnFollowers))
        
        vwRepoCard.addGestureRecognizer(tapOnRepositories)
        vwFollowersCard.addGestureRecognizer(tapOnFollowers)
    }
    
    @objc private func handleTapOnRepositories(_ gesture: UITapGestureRecognizer) {
        if let currentView = gesture.view {
            AnimationsUtils.makeRippleEffect(
                to: currentView,
                point: gesture.location(in: currentView)) {
                
                self.presenter.routeToRepositories()
            }
        }
    }
    
    @objc private func handleTapOnFollowers(_ gesture: UITapGestureRecognizer) {
        if let currentView = gesture.view {
            AnimationsUtils.makeRippleEffect(
                to: currentView,
                point: gesture.location(in: currentView)) {
                
                self.presenter.routeToFollowers()
            }
        }
    }
    
    @IBAction private func logOut(_ sender: Any) {
        presenter.logOut()
    }
 }
 
