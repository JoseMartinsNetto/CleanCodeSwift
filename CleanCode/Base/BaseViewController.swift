//
//  BaseViewController.swift
//  CleanCode
//
//  Created by Jose Martins on 22/03/21.
//

import UIKit

protocol BaseViewControllerProtocol {
    func configUI()
    func loadUI()
}

class BaseViewController: UIViewController,
                          BaseViewControllerProtocol,
                          BasePresenterDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadUI()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - BaseViewControllerProtocol
    
    func configUI() { }
    
    func loadUI() { }
    
    
    // MARK: - BasePresenterDelegate
    
    func alert(_ message: String, _ type: MessageType) {
        AlertHelper.showAlert(message: message, type: type)
    }
    
    func loading(_ loading: Bool) { }
    
    
}
