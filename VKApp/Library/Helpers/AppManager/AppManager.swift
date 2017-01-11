//
//  AppManager.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class AppManager: NSObject {
    internal static let sharedInstance = AppManager()
    
    var accessToken:AccessToken = { () -> AccessToken in
        let token = AccessToken()
        token.load()
        return token
    }()
}
