//
//  UserCell.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 16/09/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var questionMarkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        questionMarkImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    func configureCell(userImage: UIImage, userEmail: String, isSelected: Bool) {
        self.userImage.image = userImage
        self.userEmailLbl.text = userEmail
        if isSelected {
            questionMarkImage.isHidden = false
        } else {
            questionMarkImage.isHidden = true
        }
    }
}
