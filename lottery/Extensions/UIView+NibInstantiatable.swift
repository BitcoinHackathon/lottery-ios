//
//  UIView+NibInstantiatable.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import UIKit
import Foundation

public protocol NibInstantiatable {
    static var nibName: String { get }
    static var nibBundle: Bundle { get }
    static var nibOwner: Any? { get }
    static var nibOptions: [UINib.OptionsKey: Any]? { get }
    static var instantiateIndex: Int { get }
}

public extension NibInstantiatable where Self: NSObject {
    public static var nibName: String { return className }
    public static var nibBundle: Bundle { return Bundle(for: self) }
    public static var nibOwner: Any? { return self }
    public static var nibOptions: [AnyHashable: Any]? { return nil }
    public static var instantiateIndex: Int { return 0 }
}

public extension NibInstantiatable where Self: UIView {
    public static func instantiate() -> Self {
        let nib = UINib(nibName: nibName, bundle: nibBundle)
        return nib.instantiate(withOwner: nibOwner, options: nibOptions)[instantiateIndex] as! Self
    }
    
    public static func instantiate(frame:CGRect) -> Self {
        let nib = UINib(nibName: nibName, bundle: nibBundle)
        let instance = nib.instantiate(withOwner: nibOwner, options: nibOptions)[instantiateIndex] as! Self
        instance.frame = frame
        return instance
    }
}

public protocol EmbeddedNibInstantiatable {
    associatedtype Embedded: NibInstantiatable
}

public extension EmbeddedNibInstantiatable where Self: UIView, Embedded: UIView {
    public var embedded: Embedded { return subviews[0] as! Embedded }
    
    public func configureEmbededView() {
        let view = Embedded.instantiate()
        insertSubview(view, at: 0)
        view.fillSuperview()
    }
}
