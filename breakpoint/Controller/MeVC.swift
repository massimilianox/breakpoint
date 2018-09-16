//
//  MeVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 26/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userEmail.text = Auth.auth().currentUser?.email
    }

    @IBAction func logoutBtnPressed(_ sender: Any) {
        let alertPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "authVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error as Any)
            }
            
        }
        
        alertPopup.addAction(alertAction)
        present(alertPopup, animated: true, completion: nil)
        
    }
}
