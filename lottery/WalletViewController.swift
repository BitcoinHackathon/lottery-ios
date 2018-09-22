//
//  WalletViewController.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit
import BitcoinKit

class WalletViewController: UIViewController {
    
    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var balanceFiatLabel: UILabel!
    @IBOutlet weak var balanceSatoshiLabel: UILabel!
    
    private var wallet: Wallet? = Wallet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createWalletIfNeeded()
        updateLabels()
    }
    
    func createWalletIfNeeded() {
        if wallet == nil {
            let privateKey: PrivateKey = PrivateKey(network: .testnet)
            wallet = Wallet(privateKey: privateKey)
            wallet?.save()
        }
    }
    
    func updateLabels() {
        addressLabel.text = wallet?.address.cashaddr
        qrCodeImageView.image = wallet?.address.qrImage()
        if let balance = wallet?.balance() {
            balanceSatoshiLabel.text = "\(balance) satoshi"
            let jpBalance = Double(balance) * (701453.0 * 0.00000001)
            balanceFiatLabel.text = String(format: "¥:%.2f", jpBalance)
        }
        
    }
    
    func reloadBalance() {
        // TODO: 3-2. Balanceの更新
        wallet?.reloadBalance(completion: { [weak self] (utxos) in
            DispatchQueue.main.async { self?.updateLabels() }
        })
    }
    
    @IBAction func didTapReloadBalanceButton(_ sender: UIButton) {
        reloadBalance()
    }
    
}
