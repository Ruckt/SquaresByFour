//
//  ELVenueTableVCCell.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/7/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation
import UIKit

class ELVenueTableVCCell: UITableViewCell {
    
    static let kCellIdentifier = "VenueTableVCCell"
    
    @IBOutlet var venueNameLabel: UILabel?
    @IBOutlet var disatanceLabel: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        venueNameLabel?.text = ""
        disatanceLabel?.text = ""
    }
}
