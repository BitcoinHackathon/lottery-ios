//
//  DetailViewController.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, StoryboardInstantiatable {
    
    static var nibOptions: [UINib.OptionsKey : Any]?
    
    @IBOutlet weak var tableView: UITableView!
    var address:[String] = ["afsajgkdhwa932u52ohfiwlsd", "wagij283798fjfdlsf"]
    var tapHandler: ((_ address: String)->())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AddressCell.self)
        
        tapHandler = {(address: String) in
            print("\(address)tapped!!")
            self.showConfirmationAlert(address: address)
        }
    }
    
    private func showConfirmationAlert(address: String) {
        let confirmSendingAlertView = ConfirmSendingAlertView.instantiate()
        confirmSendingAlertView.okBlock = { print("ok") }
        confirmSendingAlertView.setup(frame: view.bounds,
                                      addr: address,
                                      mainAmount: "¥200",
                                      subAmount: "10 satoshi")
        let alertController = YenomAlertController(alertView: confirmSendingAlertView)
        present(alertController, animated: false, completion: nil)
    }
}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.defaultReuseIdentifier, for: indexPath) as! AddressCell
        cell.addressLabel.text = address[indexPath.row]
        cell.handler = tapHandler
        return cell
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
    }
}
