//
//  RepositoriesRouter.swift
//
//  Created by José Martins on 24/03/2021.
//

import UIKit

final class RepositoriesRouter: BaseRouter<RepositoriesViewController> {
    
    private let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
    
    override init() {
        super.init()
        
        if let controller = storyboard
            .instantiateViewController(identifier: "RepositoriesView") as? RepositoriesViewController {
            
            let presenter = RepositoriesPresenter(
                delegate: controller,
                router: self,
                manager: RepositoriesManager()
            )
            
            self.viewController = controller
            self.viewController.presenter = presenter
        }
    }
}
