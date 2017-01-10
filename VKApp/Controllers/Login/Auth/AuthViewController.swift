//
//  AuthViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    var success: ((_ token:String) -> (Void))?
    var cancel: ((Void) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension AuthViewController {
    
    @IBAction func cancelButtonPressed() {
        if cancel != nil  {
            cancel?()
            dismiss(animated: true, completion: nil)
        }
    }
}
