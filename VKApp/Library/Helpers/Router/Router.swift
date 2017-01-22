//
//  Router.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

enum ControllersType:String {
    case friends = "friends", news = "news", groups = "groups"
}

class Router: NSObject {

    class func getController(forTitle:String) -> BaseViewController {
        
        var controller:BaseViewController = BaseViewController()
        
        switch forTitle {
        case ControllersType.friends.rawValue:
            controller = FriendsViewController.controller() as! BaseViewController
            
        default: break
            //
        }
        return controller
    }
    
}
