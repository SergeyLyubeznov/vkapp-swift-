//
//  FriendsViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class FriendsViewController: BaseViewController {
    
    @IBOutlet internal weak var tableView:UITableView!
    
    var friends:[User] = [] {
        didSet{
            tableView.reload()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tabBarItem = TabBarItem()
        tabBarItem.title = "Друзья"
        tabBarItem.imageName = "friends_tab_icon"
        tabBarObject = tabBarItem
    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Friends"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFriends()
    }
    
    private func setupTableView() {
        tableView.hideEmtyCells()
         tableView.enableAutolayout()
    }
    
    private func loadFriends() {
        
        let api = FriendsAPI()
        api.object = AppManager.sharedInstance.accessToken.userId as AnyObject?
        api.startRequest { (data, error) in
            if let friends = data as? [User] {
                self.friends = friends
            }
        }
    }

}
