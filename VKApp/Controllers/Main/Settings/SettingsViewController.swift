//
//  SettingsViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tabBarObject = TabBarItem(title: Constants.Controllers.TabTitle.Settings,
                                  imageName:Constants.Controllers.TabImage.Settings)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override class func storyboardName() -> String {
        // override method for other storyboard names
        return "Settings"
    }

}
