//
//  CounterView.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class CounterView: UIView {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var countLabel:UILabel!
    
    var pressedCounter: ((_ string:String) -> (Void))?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let button = UIButton()
        button.addTarget(self, action: #selector(CounterView.buttonPressed), for: .touchUpInside)
        addSubview(button)
        
        NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: self,
                           attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: self,
                           attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self,
                           attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: self,
                           attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    func viewModel(model:CounterItem) {
        titleLabel.text = model.title
        countLabel.text = String(format:"%d",model.count)
    }
    
    func buttonPressed() {
        if pressedCounter != nil {
            pressedCounter!(titleLabel.text!)
        }
    }
    
}
