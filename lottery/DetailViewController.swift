//
//  DetailViewController.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit
import APIKit

class DetailViewController: UIViewController, StoryboardInstantiatable {
    
    static var nibOptions: [UINib.OptionsKey : Any]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var addresses = [LotteryAddress]()
    var tapHandler: ((_ address: String)->())!
    var lottery: Lottery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AddressCell.self)
        
        tapHandler = {(address: String) in
            print("\(address)tapped!!")
            self.showConfirmationAlert(address: address)
        }
        
        if let id = lottery?.id {
            let request = AddressRequest(lotteryId: id)
            Session.send(request) { result in
                switch result {
                case .success(let addresses):
                    self.addresses = addresses
                    self.tableView.reloadData()
                case .failure(let error):
                    print("error: \(error)")
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = lottery?.title
        descriptionTextView.text = lottery?.describe
    }
    
    private func showConfirmationAlert(address: String) {
        guard let price = lottery?.price else { return }
        let confirmSendingAlertView = ConfirmSendingAlertView.instantiate()
        confirmSendingAlertView.okBlock = {
            LOWallet.send(addressString: address, amount: UInt64(100))
        }
        let jpPrice = Double(price) * (701453.0 * 0.00000001)
        confirmSendingAlertView.setup(frame: view.bounds,
                                      addr: address,
                                      mainAmount: "¥\(jpPrice)",
                                      subAmount: "\(price) satoshi")
        let alertController = YenomAlertController(alertView: confirmSendingAlertView)
        present(alertController, animated: false, completion: nil)
    }
}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.defaultReuseIdentifier, for: indexPath) as! AddressCell
        cell.addressLabel.text = addresses[indexPath.row].address
        cell.handler = tapHandler
        return cell
    }
}
