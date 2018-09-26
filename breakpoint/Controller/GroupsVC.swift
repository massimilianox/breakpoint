//
//  GroupsVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 24/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var groupsListTableView: UITableView!
    
    var groupsArray = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsListTableView.delegate = self
        groupsListTableView.dataSource = self
        
        DataService.instance.getGroups { (groupsArray) in
            self.groupsArray = groupsArray
            self.groupsListTableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell {
            
            let title = groupsArray[indexPath.row]["title"] as! String
            let description = groupsArray[indexPath.row]["description"] as! String
            let idsArray = groupsArray[indexPath.row]["registeredIds"] as! [String]
            
            cell.configureCell(title: title, description: description, numberOfUser: idsArray.count)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else { return }
        
        groupFeedVC.initGroupFeed(forGroup: groupsArray[indexPath.row]) 
        presentDetail(groupFeedVC) 
    }
    

}

