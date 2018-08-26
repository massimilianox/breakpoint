//
//  AuthService.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 25/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import Foundation
import Firebase


class AuthService {
    
    static var instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, completion: @escaping (_ error: Error?) -> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (data, error) in
            
            guard let user = data?.user else {
                completion(error)
                return
            }

            let userData: Dictionary<String, Any> = [
                "provider": user.providerID,
                "email": user.email!
            ]

            print("provider: \(user.providerID)\nuser: \(user.email!)\nuid: \(user.uid)")
            
            DataService.instance.createDBUser(uid: user.uid, userData: userData, completion: { (error) in
                if error != nil {
                    print("user DB NOT created")
                    completion(error)
                } else {
                    print("user DB created")
                    completion(nil)
                }
            })
            
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, completion: @escaping (_ error: Error?) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (data, error) in

            if error != nil {
                print("user not logged in\(String(describing: error?.localizedDescription))")
                completion(error)
                return
            }
            
            print("user logged in")
            completion(nil)
        }
    }
}
