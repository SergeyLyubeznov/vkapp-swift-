//
//  AuthViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class AuthViewController: BaseViewController {
    
    var success: ((_ token:AccessToken) -> (Void))?
    var cancel: ((Void) -> (Void))?
    
    let authManager = AuthManager()
    
    @IBOutlet weak var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = authManager.request
        webView.loadRequest(request() as URLRequest)
    }
    
    @IBAction func cancelButtonPressed() {
        if cancel != nil  {
            cancel?()
            dissmisModal()
        }
    }
}

extension AuthViewController:UIWebViewDelegate {
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        
        let string = webView.request?.url?.absoluteString
        
        if string?.lowercased().range(of: "access_token") != nil {
            
            let accessToken = authManager.getAccessToken(path: string)
            if success != nil {
                dismiss(animated: true, completion: { 
                    self.success?(accessToken)
                })
                
            }
        }
    }
    
}
