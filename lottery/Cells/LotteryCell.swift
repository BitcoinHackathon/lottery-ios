//
//  LotteryCell.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit

class LotteryCell: UICollectionViewCell, NibInstantiatable {
    static var nibOptions: [UINib.OptionsKey : Any]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
}
