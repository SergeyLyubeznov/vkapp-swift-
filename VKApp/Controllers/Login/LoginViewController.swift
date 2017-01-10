//
//  LoginViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let authController:AuthViewController = segue.destination as! AuthViewController
        
        authController.success = {(token) in
            print(token)
            self.showMainController()
        }
        
        authController.cancel = {() in
            print("cancel auth")
        }
    }
    
    private func showMainController () {
        
        let mainController = MainViewController.controller() as! MainViewController
        present(mainController, animated: true, completion: nil)
    }
    
}
