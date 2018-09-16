//
//  DataService.swift
//  breakpoint
//
//  Created by Massimiliano Abeli on 24/08/2018.
//  Copyright © 2018 Massimiliano Abeli. All rights reserved.
//

import Foundation
import Firebase

// let DB_BASE = Database.database().reference()

let DB_BASE = Firestore.firestore()

class DataService {
    
    static let instance = DataService()
    
    private var _REF_USERS = DB_BASE.collection("users")
    private var _REF_GROUPS = DB_BASE.collection("groups")
    private var _REF_FEED = DB_BASE.collection("feed")
    
//    var REF_BASE: DatabaseReference {
//        return _REF_BASE
//    }
    
//    var REF_USERS: DatabaseReference {
//        return _REF_USERS
//    }
    
//    var REF_GROUPS: DatabaseReference {
//        return _REF_GROUPS
//    }
//
//    var REF_FEED: DatabaseReference {
//        return _REF_FEED
//    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>, completion: @escaping (_ error: Error?) -> ()) {
        
        _REF_USERS.document(uid).setData(userData) { (error) in
            if error != nil {
                debugPrint("set user data Failed: \(String(describing: error?.localizedDescription))")
                completion(error)
            } else {
                print("user collection created or updated")
                completion(nil)
            }
        }
    }
    
    func postMessage(message: String, withGroupKey groupKey: String?, completion: @escaping (_ error: Error?) -> ()) {
        if groupKey != nil {
            
        } else {
            let uid = Auth.auth().currentUser?.uid as Any
            let messageData: Dictionary<String, Any> = [
                "content": message,
                "senderId": uid
            ]
            
            _REF_FEED.document().setData(messageData) { (error) in
                if error != nil {
                    print("message data error")
                    completion(error)
                } else {
                    print("message data success")
                    completion(nil)
                }
            }
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        print("function called!");
        
        _REF_FEED.addSnapshotListener(includeMetadataChanges: false, listener: { (messagesData, error) in
            var messageArray = [Message]()
            guard let feedMessageSnapshot = messagesData else { return }
            
            for aMessage in feedMessageSnapshot.documents {
                let content = aMessage["content"] as! String
                let senderId = aMessage["senderId"] as! String
                let messagge = Message(content: content, senderId: senderId)
                messageArray.append(messagge)
            }
            
            handler(messageArray);
            
        })
    }
    
    func getUserName(uid: String, handler: @escaping (_ userName: String) -> ()) {
        
        _REF_USERS.document(uid).getDocument() { (userData, error) in
            
            if let user = userData, (userData?.exists)! {
                handler(user["email"] as! String)
            } else {
                print("something went terribly wrong")
            }
            
            if error != nil {
                print("error retriving user data \(String(describing: error))")
            }
            
        }
    }
    
}











