//
//  RepositoriesViewController.swift
//
//  Created by José Martins on 24/03/2021.
//

import UIKit

final class RepositoriesViewController: BaseViewController,
                                        UITableViewDelegate,
                                        UITableViewDataSource,
                                        RepositoriesPresenterDelegate {
    
    var presenter: RepositoriesPresenter!
    
    @IBOutlet private var tbRepositories: UITableView!
    
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
        return presenter.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryDetailsTableViewCell", for: indexPath) as! RepositoryDetailsTableViewCell
        
        let repository = presenter.repositories[indexPath.row]
        
        cell.loadUI(name: repository.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - PresenterDelegate
    
    func dataLoaded() {
        tbRepositories.reloadData()
    }
    
    // MARK: - Custom Methods
    
    @IBAction func closeview(_ sender: Any) {
        presenter.closeView()
    }
}
