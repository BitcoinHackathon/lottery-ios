//
//  PrizeModel.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation
import APIKit
import UIKit

class PrizeModel: NSObject {
    static let shared = PrizeModel()
    
    var isChecked = false
    
    func check() {
        if isChecked {
            return
        }
        let request = PrizeRequest(address: LOWallet.wallet.address.cashaddr)
        
        Session.send(request) { result in
            switch result {
            case .success(let prize):
                let prizeViewController = PrizeViewController.instantiate()
                var sum = 0
                for r in prize {
                    sum = r.prize + sum
                }
                let msg = sum > 0 ? "おめでとうございます！！" : "残念でした"
                prizeViewController.setLabels(prize: sum, message: msg)
                UIApplication.shared.topViewController?.present(prizeViewController, animated: true, completion: nil)
            case .failure(let error):
                print("error: \(error)")
            }
        }
        isChecked = true
    }
    
}
