//
//  LoginViewController.swift
//
//  Created by José Martins on 22/03/2021.
//

import UIKit

class LoginViewController: BaseViewController,
                           LoginPresenterDelegate {
    
    var presenter: LoginPresenter!
    
    @IBOutlet private var txtUserNameField: UITextField!
    @IBOutlet private var btnLogin: UIButton!
    @IBOutlet private var actLoginLoading: UIActivityIndicatorView!
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController, BaseViewController
    //-----------------------------------------------------------------------    
    
    override func configUI() {
        super.configUI()
    }
    
    override func loadUI() {
        super.loadUI()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - LoginPresenterDelegate
    //-----------------------------------------------------------------------
    
    override func loading(_ loading: Bool) {
        if loading {
            actLoginLoading.startAnimating()
            btnLogin.setTitle("", for: .normal)
            return
        }
        
        actLoginLoading.stopAnimating()
        btnLogin.setTitle(Constants.Strings.Login, for: .normal)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------
    
    @IBAction private func makeLogin(_ sender: UIButton) {
        view.endEditing(true)
        
        presenter.makeLogin(gitHubUser: txtUserNameField.text)
    }
}
