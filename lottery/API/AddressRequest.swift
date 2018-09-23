//
//  AddressRequest.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation
import APIKit

struct AddressRequest: Request {
    
    typealias Response = [LotteryAddress]
    let lotteryId: Int
    
    var baseURL: URL {
        return URL(string: "http://153.127.192.226:3000")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/lottery/\(lotteryId)"
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [LotteryAddress] {
        let data = try JSONSerialization.data(withJSONObject: object, options: [])
        return try JSONDecoder().decode([LotteryAddress].self, from: data)
    }
}

struct LotteryAddress: Decodable {
    let address: String
    let used: String
}
