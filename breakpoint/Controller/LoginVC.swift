//
//  LoginVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 25/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: LoginTextField!
    @IBOutlet weak var passwordField: LoginTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (error) in
            if error != nil {
                debugPrint(String(describing: error?.localizedDescription))
                AuthService.instance.registerUser(withEmail: email, andPassword: password, completion: { (error) in
                    if error != nil {
                        debugPrint("User NOT successfully register \(String(describing: error?.localizedDescription))")
                    } else {
                        print("User successfully register and loggedin")
                        AuthService.instance.loginUser(withEmail: email, andPassword: password, completion: { (error) in
                            if error != nil {
                                debugPrint(String(describing: error?.localizedDescription))
                            } else {
                                self.dismiss(animated: true, completion: nil)
                                print("User successfully logged in")
                            }
                        })
                    }
                })
                
            } else {
                self.dismiss(animated: true, completion: nil)
                print("User successfully logged in")
            }
        }
        
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
}
