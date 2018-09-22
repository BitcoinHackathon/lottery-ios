//
//  ConfirmSendingAlertView.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit

class ConfirmSendingAlertView: UIView, NibInstantiatable, YenomAlertViewProtocol {
    
    static var nibOptions: [UINib.OptionsKey : Any]?
    
    @IBOutlet weak var alertView: UIView! // ToDo: xibファイルを修正して，削除
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mainAmountLabel: UILabel!
    @IBOutlet weak var subAmountLabel: UILabel!
    @IBOutlet weak var confirmationLabel: UILabel!
    
    weak var delegate: YenomAlertViewDelegate?
    var okBlock: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(frame _frame:CGRect, addr:String, mainAmount:String, subAmount:String) {
        frame = CGRect(x: _frame.width * 0.1, y: _frame.height * 0.2, width: _frame.width * 0.8, height: 420)
        addressLabel.text = addr
        mainAmountLabel.text = mainAmount
        subAmountLabel.text = subAmount
        confirmationLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        okBlock?()
        delegate?.hide()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        delegate?.hide()
    }
}
