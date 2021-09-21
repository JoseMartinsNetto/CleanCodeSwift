//
//  FollowersViewController.swift
//
//  Created by José Martins on 22/03/2021.
//

import UIKit

final class FollowersViewController: BaseViewController,
                                     UITableViewDelegate,
                                     UITableViewDataSource,
                                     FollowersPresenterDelegate {
    
    var presenter: FollowersPresenter!
    
    @IBOutlet private var tbFollowers: UITableView!
    
    // MARK: - BaseTableViewController
    
    override func configUI() {
        super.configUI()
    }
    
    override func loadUI() {
        super.loadUI()
        
        presenter.loadData()
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.followers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryDetailsTableViewCell", for: indexPath) as! RepositoryDetailsTableViewCell
        
        let follower = presenter.followers[indexPath.row]
        
        cell.loadUI(name: follower.userName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - PresenterDelegate
    
    func dataLoaded() {
        tbFollowers.reloadData()
        
        AnimationsUtils.makeBasicAnimation(in: self.view) {
            self.tbFollowers.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Custom Methods
    
    @IBAction private func closeview(_ sender: Any) {
        presenter.closeView()
    }
}
