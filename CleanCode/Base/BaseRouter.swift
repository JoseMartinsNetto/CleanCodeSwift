//
//  BaseRouter.swift
//  CleanCode
//
//  Created by Jose Martins on 21/03/21.
//

import UIKit

class BaseRouter<T: UIViewController> {
    
    var viewController: T!
    var presentationStyles: Array<PresentationStyle> = []
    
    func getRootView() -> UIViewController {
        
        var navigationVC: UINavigationController!
        
        if let login = Session.get()?.login, !login.isEmpty {
            navigationVC = UINavigationController(rootViewController: HomeRouter().viewController)
        } else  {
            navigationVC = UINavigationController(rootViewController: LoginRouter().viewController)
        }
        
        return navigationVC
    }
    
    func dismiss(animated: Bool = true) {
        
        if let lastTransition = presentationStyles.last {
            
            if lastTransition == .push {
                viewController.navigationController?.popViewController(animated: animated)
            }else{
                viewController.dismiss(animated: animated, completion: nil)
            }
            
            presentationStyles.removeLast()
        }
    }
    
    func show() {
        
        presentationStyles.append(.push)
        
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func closeAllViews(animated: Bool = true) {
        
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: animated, completion: nil)
    }
    
    func routeToHome() {
        HomeRouter().show()
    }
    
    func routeToLogin() {
        LoginRouter().show()
    }
    
    func routeToRepositories() {
        RepositoriesRouter().show()
    }
    
    func routeToFollowers() {
        FollowersRouter().show()
    }
}


