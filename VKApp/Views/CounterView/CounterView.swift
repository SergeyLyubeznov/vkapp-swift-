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

    func viewModel(model:CounterItem) {
        titleLabel.text = model.title
        countLabel.text = String(format:"%d",model.count)
    }
    
}
