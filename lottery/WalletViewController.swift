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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateLabels()
    }
    
    func updateLabels() {
        addressLabel.text = LOWallet.wallet.address.cashaddr
        qrCodeImageView.image = LOWallet.wallet.address.qrImage()
        let balance = 50000//LOWallet.wallet.balance()
        balanceSatoshiLabel.text = "\(balance) satoshi"
        let jpBalance = Double(balance) * (701453.0 * 0.00000001)
        balanceFiatLabel.text = String(format: "¥%.2f", jpBalance)
        
    }
    
    func reloadBalance() {
        // TODO: 3-2. Balanceの更新
        LOWallet.wallet.reloadBalance(completion: { [weak self] (utxos) in
            DispatchQueue.main.async { self?.updateLabels() }
        })
    }
    
    @IBAction func didTapReloadBalanceButton(_ sender: UIButton) {
        reloadBalance()
    }
    
}
