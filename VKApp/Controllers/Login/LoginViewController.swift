//
//  LoginViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import VK_ios_sdk

let skope:[String] = Constants.API.UserScope

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVKSdk()
    }
    
    private func initVKSdk() {
         VKSdk.initialize(withAppId: Constants.API.AppId).register(self)
        
            VKSdk.wakeUpSession(skope) { (state, error) in
                if (state == VKAuthorizationState.authorized) {
                    // Authorized and ready to go
                } else if (state == VKAuthorizationState.initialized) {
                    //need Aut
                }
        }
    }
    
    @IBAction func loginButtonPressed(sender:UIButton) {
       // VKSdk.authorize(skope)
        VKSdk.authorize(skope, with: [.disableSafariController,.unlimitedToken])
    }
}

extension LoginViewController : VKSdkDelegate, VKSdkUIDelegate {
    public func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(result)
    }
    
    public func vkSdkUserAuthorizationFailed() {
        print("vkSdkUserAuthorizationFailed")
    }
    
    public func vkSdkShouldPresent(_ controller: UIViewController!) {
        
    }
    
    
    /**
     Calls when user must perform captcha-check.
     If you implementing this method by yourself, call -[VKError answerCaptcha:] method for captchaError with user entered answer.
     
     @param captchaError error returned from API. You can load captcha image from <b>captchaImg</b> property.
     */
    public func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }
}
