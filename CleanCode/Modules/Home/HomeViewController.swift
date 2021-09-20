//
//  HomeViewController.swift
//
//  Created by José Martins on 22/03/2021.
//

import UIKit

class HomeViewController: BaseViewController,
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
    
    func setupGuestures() {
        let tapOnRepositories = UITapGestureRecognizer(target: self, action: #selector(handleTapOnRepositories))
        let tapOnFollowers = UITapGestureRecognizer(target: self, action: #selector(handleTapOnFollowers))
        
        vwRepoCard.addGestureRecognizer(tapOnRepositories)
        vwFollowersCard.addGestureRecognizer(tapOnFollowers)
    }
    
    @objc func handleTapOnRepositories(_ gesture: UITapGestureRecognizer) {
        if let currentView = gesture.view {
            AnimationsUtils.makeRippleEffect(
                to: currentView,
                point: gesture.location(in: currentView)) {
                
                self.presenter.routeToRepositories()
            }
        }
    }
    
    @objc func handleTapOnFollowers(_ gesture: UITapGestureRecognizer) {
        if let currentView = gesture.view {
            AnimationsUtils.makeRippleEffect(
                to: currentView,
                point: gesture.location(in: currentView)) {
                
                self.presenter.routeToFollowers()
            }
        }
    }
    
    @IBAction func logOut(_ sender: Any) {
        presenter.logOut()
    }
    
 }
 
