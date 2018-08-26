//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 26/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import UIKit

class CreatePostVC: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var postMessageTxt: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func postBtnPressed(_ sender: Any) {
        
        if postMessageTxt.text != nil && postMessageTxt.text != "" {
            DataService.instance.postMessage(message: postMessageTxt.text, withGroupKey: nil) { (error) in
                if error != nil {
                    debugPrint("post message went wrong \(String(describing: error?.localizedDescription))")
                } else {
                    print("data correctly saved")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

