//
//  FeedCell.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 13/09/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var messaggeTxt: UILabel!
    
    func congfigureCell(profileImage: UIImage, userName: String, messaggeTxt: String) {
        self.profileImg.image = profileImage
        self.userName.text = userName
        self.messaggeTxt.text = messaggeTxt
    }
    
}
