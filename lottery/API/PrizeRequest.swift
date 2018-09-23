//
//  ResultRequest.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation
import APIKit

struct PrizeRequest: Request {
    
    typealias Response = [LotteryResult]
    let address: String
    
    var baseURL: URL {
        return URL(string: "http://153.127.192.226:3000")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/lottery/prize/\(address)"
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [LotteryResult] {
        let data = try JSONSerialization.data(withJSONObject: object, options: [])
        return try JSONDecoder().decode([LotteryResult].self, from: data)
    }
}

struct LotteryResult: Decodable {
    let buyer_addr: String
    let prize: Int
}
