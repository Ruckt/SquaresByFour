//
//  FourSquareItem.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

typealias FourSquareItemsArray = [FourSquareItem]

struct FourSquareItem: Codable {
    let referralId: String
    let venue: FourSquareVenue
}
