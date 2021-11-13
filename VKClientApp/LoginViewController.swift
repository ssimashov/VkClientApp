//
//  LoginViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 13.11.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let toOrangeSegue = "fromLoginToOrange"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func pressLoginButton(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text
        else {return}
        
        if login.isEmpty || password.isEmpty {
            loginTextField.backgroundColor = UIColor.red
            passwordTextField.backgroundColor = UIColor.red
            return
        }
        
        
        if login == "1" && password == "1"{
            performSegue(withIdentifier: toOrangeSegue, sender: nil)
            
        }
        
        
        
    }
    

}
