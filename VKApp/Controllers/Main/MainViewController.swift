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

        view.backgroundColor = UIColor.black
        
        addControllers()
    }
    
    override class func storyboardName() -> String {
        return "Main"
    }
    
    private func setupUI() {
        
        tabBar.barTintColor = UIColor.black
        tabBar.backgroundColor = UIColor.black
        tabBar.tintColor = UIColor.white
    
    }
    
    private func addControllers() {
        
        let home = HomeViewController.controller() as! BaseViewController
        setViewControllers([home], animated: true)
        
        let tabHome = tabBar.items?[0]
        
        if let item = home.tabBarObject {
            tabHome?.title = item.title
            tabHome?.image = UIImage(named:item.imageName!)
            tabHome?.selectedImage = UIImage(named:item.selectedImageName!)
        } else {
            
        }
        
        
    }

}
