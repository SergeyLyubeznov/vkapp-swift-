//
//  ApiManager.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
    
    class func loadProfile(completion:@escaping (_ profile: Profile?) -> Void) {
        
        let myProfileAPI = MyProfileAPI()
        myProfileAPI.startRequest { (data, error) in
            
            if let profile = data as? Profile {
                let userId = AppManager.sharedInstance.accessToken.userId
                profile.id = UInt(userId!)!
                
                
                self.loadUserAt(userId: userId!, completion: { (user) in
                    if let user = user {
                        profile.user = user
                        completion(profile)
                    }
                })
            }
        }
    }
    
    class func loadUserAt(userId:String,completion:@escaping (_ user: User?) -> Void) {
        
        let userAPI = UserAPI()
        userAPI.object = userId as AnyObject?
        userAPI.startRequest{ (data, error) in
            
            guard let array = data as? Array<User> else {
                return
            }
            
            if let user = array.first {
                completion(user)
            }
        }
    }
    
    class func loadFriendsAt(userId:String,completion:@escaping (_ friends: [User]?) -> Void) {
        
        let api = FriendsAPI()
        api.object = userId as AnyObject?
        api.startRequest { (data, error) in
            if let friends = data as? [User] {
                completion(friends)
            }
        }
    }
}
