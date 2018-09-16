//
//  CreateGroupVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 16/09/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var titleTextField: LoginTextField!
    @IBOutlet weak var descriptionTextField: LoginTextField!
    @IBOutlet weak var addEmailsTextField: LoginTextField!
    @IBOutlet weak var addEmailsLbl: UILabel!
    @IBOutlet weak var emailListTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
    }
    
}
