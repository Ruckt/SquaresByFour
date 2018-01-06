//
//  FourSquareItem.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

typealias FSItemsArray = [FourSquareItem]

struct FourSquareItem: Codable {
   // let venue: FourSquareVenue
    let reasons : String
    let tips: String
    let referralId: String
    
    enum CodingKeys: String, CodingKey {
       // case FourSquareVenue
        case reasons = "reasons"
        case tips = "tips"
        case referralId = "referralId"
    }
}

//extension FourSquareItem: Decodable {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//       // venue = try values.decode(FourSquareVenue.self, forKey: .venue)
//        reasons = try values.decode(String.self, forKey: .reasons)
//        tips = try values.decode(String.self, forKey: .tips)
//        referralId =  try values.decode(String.self, forKey: .referralId)
//    }
//}

