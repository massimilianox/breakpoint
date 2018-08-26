//
//  MeVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 26/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutBtnPressed(_ sender: Any) {
    }
}
