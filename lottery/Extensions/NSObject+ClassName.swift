//
//  NSObject+ClassName.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/22.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    public static var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
