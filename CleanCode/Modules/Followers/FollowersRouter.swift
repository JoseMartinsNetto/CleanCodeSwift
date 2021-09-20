//
//  FollowersRouter.swift
//
//  Created by José Martins on 22/03/2021.
//

import UIKit

final class FollowersRouter: BaseRouter<FollowersViewController> {
    
    private let storyboard = UIStoryboard(name: "Followers", bundle: nil)
    
    override init() {
        super.init()
        
        if let controller = storyboard
            .instantiateViewController(identifier: "FollowersView") as? FollowersViewController {
            
            let presenter = FollowersPresenter(
                delegate: controller,
                router: self,
                manager: FollowersManager()
            )
            
            self.viewController = controller
            self.viewController.presenter = presenter
        }
    }
}
