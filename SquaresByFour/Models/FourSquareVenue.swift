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
    let categories: [FourSquareCategory]
    let location: FourSquareLocation
}

struct FourSquareLocation: Codable {
    var distance: Int?
}

struct FourSquareCategory: Codable {
    let icon: FourSquareIcon
}

struct FourSquareIcon: Codable {
    let prefix: String
    let suffix: String
}
