//
//  AccessToken.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

let key = "access_token"

class AccessToken {
    
    var token:String?
    var expires:String?
    var userId:String?
    
    var valid:Bool = false
    
    var tokenData:[String:String]? {
        didSet{
            if tokenData != nil {
                token = tokenData?["access_token"]
                expires = tokenData?["expires_in"]
                userId = tokenData?["user_id"]
                
                //TODO: add real check valid token
                valid = true
            } else {
                Defaults[key] = nil
                valid = false
            }
        }
    }
    
    func load() {
        
        if let data = Defaults.value(forKey: key) {
            tokenData = data as? [String:String]
        }
        
    }
    
    func clear() {
        tokenData = nil
    }
    
    func save() {
        Defaults.set(tokenData, forKey: key)
    }
}
