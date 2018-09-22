//
//  LOWallet.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation
import BitcoinKit

class LOWallet {
    
    static var wallet: Wallet {
        get {
            if let wallet = Wallet() {
                return wallet
            }
            let privateKey: PrivateKey = PrivateKey(network: .testnet)
            let wallet = Wallet(privateKey: privateKey)
            wallet.save()
            return wallet
        }
    }
    
    static func send(addressString: String, amount: UInt64) {
        do {
            let address: Address = try AddressFactory.create(addressString)
            try wallet.send(to: address, amount: amount, completion: { (response) in
                print("送金完了　txid : ", response ?? "")
            })
        } catch {
            print(error)
        }
    }
}
