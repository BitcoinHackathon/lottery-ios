//
//  AddressCell.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell, NibInstantiatable {
    static var nibOptions: [UINib.OptionsKey : Any]?
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
    
    @IBAction func pushPurchaseButton() {
        
    }
}
