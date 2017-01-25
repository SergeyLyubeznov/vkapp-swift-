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
    
    weak var onlineLabel:UILabel?
    
    var user:User? {
        didSet{
            if let tableView = tableView {
                updateUI()
                tableView.reload()
            }
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
            loadUser()
        }
    }
    
    private func setupController() {
        
        let onlineLabel = UILabel(frame:CGRect(x:0,y:0,width:200,height:40))
        onlineLabel.text = Constants.Strings.Offline
        onlineLabel.textAlignment = NSTextAlignment.right
        onlineLabel.textColor = UIColor(hexString:Constants.Colors.TintColor)
        self.onlineLabel = onlineLabel
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: onlineLabel)
        
        //navigationController?.navigationBar.isHidden = isMyProfile
    }
    
    private func setupTableView() {
        
        tableView.hideEmtyCells()
        tableView.enableAutolayout()
    }
    
    private func updateUI() {
        
        guard let user = self.user else {
            return
        }
        
        onlineLabel?.text = user.online ? Constants.Strings.Online : Constants.Strings.Offline
        
    }
    
    private func loadProfile() {
        showActivityIndicator()
        ApiManager.loadProfile { (profile) in
            self.hideActivityIndicator()
            self.user = profile?.user
        }
    }
    
    private func loadUser() {
        
        let userId:String = (user?.id.description)!
        showActivityIndicator()
        ApiManager.loadUserAt(userId:userId, completion: { (user) in
            self.hideActivityIndicator()
            if let user = user {
                self.user = user
            }
        })
    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Profile"
    }

}
