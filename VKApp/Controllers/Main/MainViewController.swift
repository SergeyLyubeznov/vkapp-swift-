//
//  MainViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        addControllers()
    }
    
    override class func storyboardName() -> String {
        return "Main"
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor.black
        tabBar.barTintColor = UIColor.black
        tabBar.backgroundColor = UIColor.black
        tabBar.tintColor = UIColor.white
    
    }
    
    private func addControllers() {
        
        let home = HomeViewController.controller() as! BaseViewController
        let add = AddViewController.controller() as! BaseViewController
        let settings = SettingsViewController.controller() as! BaseViewController
        let profile = ProfileViewController.controller() as! ProfileViewController
        profile.isMyProfile = true
        let friends = FriendsViewController.controller() as! BaseViewController
        
        viewControllers = [home,profile,add,friends,settings]
        
        let count:Int = (viewControllers?.count)!
        
        for index in 0...count-1 {
            let vc = viewControllers?[index] as! BaseViewController
            let tabHome = tabBar.items?[index]
            
            if let item = vc.tabBarObject {
                tabHome?.title = item.title
                tabHome?.image = UIImage(named:item.imageName!)
                tabHome?.selectedImage = UIImage(named:item.selectedImageName!)
            }
        }
    }
}
