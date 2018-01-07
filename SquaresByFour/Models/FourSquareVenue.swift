//
//  FourSquareVenue.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

typealias ELVenuesArray = [FourSquareVenue]

struct FourSquareVenue: Codable {
    let name: String

//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//    }
}

//extension FourSquareVenue {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        name  = try values.decode(String.self, forKey: .name)
//    }
//}
