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
            tableView.reload()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        tabBarObject = TabBarItem(title: Constants.Controllers.TabTitle.Profile,
                                  imageName:Constants.Controllers.TabImage.Profile)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        setupTableView()
        
        if isMyProfile {
            
            loadProfile()
        } else {
            //loadUser()
        }
    }
    
    private func setupController() {
        
        //navigationController?.navigationBar.isHidden = isMyProfile
    }
    
    private func setupTableView() {
        
        tableView.hideEmtyCells()
        tableView.enableAutolayout()
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
