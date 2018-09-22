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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AddressCell.self)
    }
}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.defaultReuseIdentifier, for: indexPath) as! AddressCell
        return cell
    }
    
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
    }
}
