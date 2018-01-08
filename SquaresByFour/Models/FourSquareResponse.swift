//
//  FourSquareResponse.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/6/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

struct FourSquareResponse: Codable {
    let response: FourSquareResposeInternal
}

struct FourSquareResposeInternal: Codable {
    let groups : FSGroupsArray
    let headerLocation : String
}

typealias FSGroupsArray = [FourSquareGroups]

struct FourSquareGroups: Codable {
    let type : String
    let items: FourSquareItemsArray
}
