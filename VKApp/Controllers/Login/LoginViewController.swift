//
//  LoginViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

let skope:[String] = Constants.API.UserScope

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let authController:AuthViewController = segue.destination as! AuthViewController
        
        authController.success = {(token) in
        }
        
        authController.cancel = {() in
            print("cancel auth")
        }
    }
    
}
