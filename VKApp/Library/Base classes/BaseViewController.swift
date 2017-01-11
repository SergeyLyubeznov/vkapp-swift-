//
//  BaseViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var tabBarObject: TabBarItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.black
    }

}
