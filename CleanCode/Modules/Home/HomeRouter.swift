//
//  HomeRouter.swift
//
//  Created by José Martins on 22/03/2021.
//

import UIKit

final class HomeRouter: BaseRouter<HomeViewController> {
    
    private let storyboard = UIStoryboard(name: "Home", bundle: nil)
    
    override init() {
        super.init()
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "HomeView") as? HomeViewController {
            
            let presenter = HomePresenter(
                delegate: controller,
                router: self,
                manager: HomeManager()
            )
            
            self.viewController = controller
            self.viewController.presenter = presenter
        }
    }
}
