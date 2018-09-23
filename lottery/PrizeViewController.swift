//
//  PrizeViewController.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit

class PrizeViewController: UIViewController, StoryboardInstantiatable {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setLabels(prize: Int, message: String) {
//        priceLabel.text = "\(price) satoshi"
//        messageLabel.text = message
    }
}
