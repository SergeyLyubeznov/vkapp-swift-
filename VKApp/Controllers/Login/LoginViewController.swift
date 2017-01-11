//
//  LoginViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var firstLoading = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if firstLoading {
            
            firstLoading = false
            
            let token = AppManager.sharedInstance.accessToken
            
            if token.valid {
                self.loadProfileAndMoveToMain()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let authController:AuthViewController = segue.destination as! AuthViewController
        
        authController.success = {(token) in
            token.save()
            AppManager.sharedInstance.accessToken = token
            self.loadProfileAndMoveToMain()
        }
        
        authController.cancel = {() in
            print("cancel auth")
        }
    }
    
    private func loadProfileAndMoveToMain() {
        ApiManager.loadProfile()
        showMainController()
    }
    
    private func showMainController () {
        
        let mainController = MainViewController.controller() as! MainViewController
        present(mainController, animated: true, completion: nil)
    }
    
}
