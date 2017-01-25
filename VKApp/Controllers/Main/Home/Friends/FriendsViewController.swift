//
//  FriendsViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

enum FriendsType:Int {
    case all, online, mutual
}

class FriendsViewController: BaseViewController {
    
    @IBOutlet internal weak var tableView:UITableView!
    @IBOutlet internal weak var friendsSegmentedControl:UISegmentedControl!
    
    var userID:String = "0"
    var isMyFriends:Bool = false
    var friendsType:FriendsType = .all
    
    var friends:[User] = [] {
        didSet{
            tableView.reload()
            
            if friends.count > 0 {
                tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarObject = TabBarItem(title: Constants.Controllers.TabTitle.Friends,
                                  imageName:Constants.Controllers.TabImage.Friends)

    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Friends"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        setupTableView()
        loadFriends()
    }
    
    private func setupController() {
        
        friendsSegmentedControl.selectedSegmentIndex = friendsType.rawValue
        
        if isMyFriends {
            userID = AppManager.sharedInstance.accessToken.userId!
            friendsSegmentedControl.removeSegment(at: 2, animated: false)
        }

    }
    
    private func setupTableView() {
        
        tableView.hideEmtyCells()
        tableView.enableAutolayout()
    }
    
    private func loadFriends() {
        showActivityIndicator()
        APIManager.loadFriendsAt(userId: self.userID, friendsType:friendsType) { (friends) in
            self.hideActivityIndicator()
            guard let friends = friends else{return}
            self.friends = friends
        }
    }
    
    @IBAction func segmentedValueChanged(sender:UISegmentedControl) {
        
        friendsType = FriendsType(rawValue: sender.selectedSegmentIndex)!
        loadFriends()
    }

}
