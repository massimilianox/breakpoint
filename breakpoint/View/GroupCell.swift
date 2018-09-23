//
//  GroupCell.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 23/09/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var usersLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, description: String, numberOfUser: Int) {
        titleLbl.text = title
        descriptionLbl.text = description
        usersLbl.text = String(numberOfUser)
    }

}
