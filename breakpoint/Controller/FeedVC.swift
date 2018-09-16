//
//  FeedVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 24/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var feedListTableView: UITableView!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedListTableView.delegate = self
        feedListTableView.dataSource = self
        
        DataService.instance.getAllFeedMessages { (messagesArray) in
            self.messages = messagesArray.reversed()
            self.feedListTableView.reloadData()
            print("All looks good \(String(describing: messagesArray))");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell {
            
            let profileImage = UIImage(named: "defaultProfileImage")
            let userId = messages[indexPath.row].senderId
            let message = messages[indexPath.row].content
            
            DataService.instance.getUserName(uid: userId) { (userEmail) in
                cell.congfigureCell(profileImage: profileImage!, userName: userEmail, messaggeTxt: message)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}

