//
//  LoginRouter.swift
//
//  Created by José Martins on 22/03/2021.
//

import UIKit

class LoginRouter: BaseRouter<LoginViewController> {
    
    private let storyboard = UIStoryboard(name: "Login", bundle: nil)
    
    override init() {
        super.init()
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "LoginView") as? LoginViewController {
           
            let presenter = LoginPresenter(
                delegate: controller,
                router: self,
                manager: LoginManager()
            )
            
            self.viewController = controller
            self.viewController.presenter = presenter
        }
    }
}
