//
//  LoginTextField.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 25/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {

    private var padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setupView() {
        
        self.layer.borderColor = #colorLiteral(red: 0.7523762584, green: 0.7523762584, blue: 0.7523762584, alpha: 1)
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 10
        
        if self.placeholder == nil {
            return
        }
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.7523762584, green: 0.7523762584, blue: 0.7523762584, alpha: 1)])
    }
}
