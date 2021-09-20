//
//  BasePresenter.swift
//  CleanCode
//
//  Created by Jose Martins on 22/03/21.
//

import Foundation
import UIKit

protocol BasePresenterDelegate {
    func alert(_ message: String, _ type: MessageType)
    func loading(_ loading: Bool)
}

class BasePresenter<TRouter: BaseRouter<TViewController>, TManager: BaseManager, TViewController: UIViewController> {
    
    var router: TRouter
    var manager: TManager
    
    init(router: TRouter, manager: TManager) {
        self.router = router
        self.manager = manager
    }
    
    func closeView(animated: Bool = true) {
        
        DispatchQueue.main.async {
            self.router.dismiss(animated: animated)
        }
    }
    
    func closeAllViews(animated: Bool = true) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.router.closeAllViews(animated: animated)
        }
    }
}
