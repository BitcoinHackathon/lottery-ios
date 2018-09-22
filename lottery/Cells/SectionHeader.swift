//
//  SectionHeader.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView, NibInstantiatable, ReusableView {
    static var nibOptions: [UINib.OptionsKey : Any]?
    
    @IBOutlet weak var sectionLabel: UILabel!
}
