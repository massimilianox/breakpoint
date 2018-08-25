//
//  ShadowView.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 25/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {

    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 4
        self.layer.shadowColor = #colorLiteral(red: 0.2038974464, green: 0.2039384246, blue: 0.2038920522, alpha: 1)
    }
    
}
