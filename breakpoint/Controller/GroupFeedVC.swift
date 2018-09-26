//
//  GroupFeedVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 26/09/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    @IBOutlet weak var groupFeedLbl: UILabel!
    @IBOutlet weak var groupListTableView: UITableView!
    @IBOutlet weak var messageTxt: UITextField!
    @IBOutlet weak var sendMessageView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    
    var group: [String: Any] = [:]
    var groupMessages: [Message] = [] // TODO: display all the messages for a given group
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMessageView.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        groupFeedLbl.text = group["title"] as? String
        
    }
    
    func initGroupFeed(forGroup group: [String: Any]) {
        self.group = group
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        dismissDetail(self)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
    }
}
