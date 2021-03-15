//
//  ProfileVC.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import UIKit

class ProfileVC: UIViewController {
    
    enum AuthenticationMode {
        case login
        case register
    }
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var switchAuthButton: UIButton!
    
    @IBOutlet weak var emailTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var backgroundView: UIView!
    
    
    private func switchAuth() {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseInOut, animations: {
            self.firstName.alpha = self.authMode == .login ? 0 : 1
            self.lastName.alpha = self.authMode == .login ? 0 : 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    var authMode = AuthenticationMode.register {
        didSet {
            switch authMode {
            case .login:
                emailTopConstraint.constant = 32
            case .register:
                emailTopConstraint.constant = 132
            }
            switchAuth()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        backgroundView.makeRound()
        backgroundView.addBorderWithColor(color: Environment.shared.ThemeColor)
    }
    
    func register() {
        
    }
    
    func login() {

    }
    
    @IBAction func Login(_ sender: Any) {
        switch authMode {
        case .register:
            register()
            
        case .login:
            login()
        }
    }
    @IBAction func switchAuthMode(_ sender: Any) {
        switch authMode {
        case .register:
            authMode = .login
            loginButton.setTitle("Login", for: .normal)
            switchAuthButton.setTitle("New User? Register", for: .normal)

        case .login:
            authMode = .register
            loginButton.setTitle("Register", for: .normal)
            switchAuthButton.setTitle("Have an account? Login", for: .normal)
        }
    }
}
