//
//  AuthVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 25/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func emailSignInBtnPressed(_ sender: Any) {
        
        // Don't need guard cos we know there's samething
        // guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC") else { return }
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "loginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignInBtnPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSignInBtnPressed(_ sender: Any) {
    }
}
