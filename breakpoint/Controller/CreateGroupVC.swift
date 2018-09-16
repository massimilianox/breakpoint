//
//  CreateGroupVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 16/09/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var titleTextField: LoginTextField!
    @IBOutlet weak var descriptionTextField: LoginTextField!
    @IBOutlet weak var addEmailsTextField: LoginTextField!
    @IBOutlet weak var addEmailsLbl: UILabel!
    @IBOutlet weak var emailListTableView: UITableView!
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailListTableView.delegate = self
        emailListTableView.dataSource = self
        addEmailsTextField.addTarget(self, action: #selector(emailSerachFieldChange), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell {
            let image = UIImage(named: "defaultProfileImage")
            let email = emailArray[indexPath.row]
            cell.configureCell(userImage: image!, userEmail: email, isSelected: true)
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    @objc func emailSerachFieldChange() {
        if addEmailsTextField.text != "" && (addEmailsTextField.text?.count)! >= 3 {
            DataService.instance.getEmails(forQuerySearch: addEmailsTextField.text) { (arrayString) in
                self.emailArray = arrayString
                self.emailListTableView.reloadData()
            }
        } else {
            self.emailArray = []
            self.emailListTableView.reloadData()
        }
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
    }
    
}
