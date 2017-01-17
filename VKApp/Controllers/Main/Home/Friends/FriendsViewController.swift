//
//  FriendsViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class FriendsViewController: BaseViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tabBarItem = TabBarItem()
        tabBarItem.title = "Друзья"
        tabBarItem.imageName = "friends_tab_icon"
        tabBarObject = tabBarItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFriends()
    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Friends"
    }
    
    private func loadFriends() {
        
        let api = FriendsAPI()
        api.object = AppManager.sharedInstance.accessToken.userId as AnyObject?
        api.startRequest { (data, error) in
            print(data)
        }
    }

}
