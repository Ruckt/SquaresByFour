//
//  String+Extension.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/7/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
