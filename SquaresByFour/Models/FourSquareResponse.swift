//
//  FourSquareResponse.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/6/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

struct FourSquareResponse: Codable {
    // let meta: Meta
    let response: FourSquareResposeInternal
}
//struct Meta: Codable {
//    let code: Int
//    let requestId: String
//
//    enum CodingKeys: String, CodingKey {
//        case requestId = "requestId"
//        case code = "code"
//    }
//}
//
//extension Meta {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        requestId  = try values.decode(String.self, forKey: .requestId)
//        code = try values.decode(Int.self, forKey: .code)
//    }
//}

struct FourSquareResposeInternal: Codable {
    let groups : FSGroupsArray
    let headerLocation : String
}

typealias FSGroupsArray = [FourSquareGroups]

struct FourSquareGroups: Codable {
    let type : String
    let items: FourSquareItemsArray
}
