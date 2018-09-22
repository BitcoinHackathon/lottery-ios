//
//  YenomAlertController.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation
import UIKit

protocol YenomAlertViewDelegate : class {
    func hide()
}

protocol YenomAlertViewProtocol : class {
    var delegate: YenomAlertViewDelegate? { get set }
}

class YenomAlertController: UIViewController, YenomAlertViewDelegate {
    
    var alertView: UIView!
    var disableHide: Bool = false
    var backgroundTouchBlock: (()->())?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    convenience init(alertView:YenomAlertViewProtocol) {
        self.init()
        alertView.delegate = self
        guard let _alertView = alertView as? UIView else { return }
        self.alertView = _alertView
    }
    
    func setup() {
        self.modalPresentationStyle = .custom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1).withAlphaComponent(0.6)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector (self.backgroundTapped (_:)))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        show()
    }
    
    private func show() {
        view.addSubview(alertView)
        alertView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut,
                       animations: {() -> Void in
                        self.alertView.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    func hide() {
        guard !disableHide else { return }
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.alertView.alpha = 0
        }, completion: { (result) -> Void in
            self.alertView.removeFromSuperview()
        })
        dismiss(animated: false, completion: nil)
    }
    
    @objc func backgroundTapped(_ sender: UITapGestureRecognizer) {
        backgroundTouchBlock?()
        hide()
    }
}
