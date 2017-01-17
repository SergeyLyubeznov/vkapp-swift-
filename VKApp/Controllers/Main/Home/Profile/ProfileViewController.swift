//
//  ProfileViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet internal weak var tableView:UITableView!
    
    var isMyProfile:Bool = false
    
    var user:User? {
        didSet{
            reloadTableView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tabBarItem = TabBarItem()
        tabBarItem.title = "Я"
        tabBarItem.imageName = "user_tab_icon"
        tabBarObject = tabBarItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        if isMyProfile {
            loadProfile()
        } else {
            //loadUser()
        }
    }
    
    private func setupTableView() {
        tableView.hideEmtyCells()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 130.0
    }
    
    private func loadProfile() {
        ApiManager.loadProfile { (profile) in
            self.user = profile?.user
        }
    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Profile"
    }

}
