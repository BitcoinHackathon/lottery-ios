//
//  CountdownUtil.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation
import UIKit

class Countdown {
    
    static func remainToString(date: Date) -> String {
        var output: String = ""
        if date < Date() {
            return "終了しました"
        }
        var remain = Int(date.timeIntervalSinceNow)
        if (remain >= 86400) {
            output +=  String(format: "%02d", arguments: [remain/86400]) + ":"
            remain %= 86400
        }
        if (remain >= 3600) {
            output +=  String(format: "%02d", arguments: [remain/3600]) + ":"
            remain %= 3600
        }
        return output + String(format: "%02d:%02d", arguments: [remain/60, remain%60])
    }
}
