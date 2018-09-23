//
//  LotteryRequest.swift
//  lottery
//
//  Created by 冨平準喜 on 2018/09/23.
//  Copyright © 2018年 冨平準喜. All rights reserved.
//

import Foundation
import APIKit

struct LotteryRequest: Request {
    
    typealias Response = [Lottery]
    
    var baseURL: URL {
        return URL(string: "http://153.127.192.226:3000")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/lottery"
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Lottery] {
        let data = try JSONSerialization.data(withJSONObject: object, options: [])
        return try JSONDecoder().decode(Lotteries.self, from: data).data
    }
}

struct Lotteries: Decodable{
    let data: [Lottery]
}

struct Lottery: Decodable{
    let id: Int
    let title: String
    let begin: String
    let end: String
    let describe: String?
    let price: Int
}
