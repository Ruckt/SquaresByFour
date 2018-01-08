//
//  DetailViewController.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import UIKit

class ELDetailViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    
    var item : FourSquareItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = item?.venue.name
        
        if let tips = item?.tips,
            tips.count > 0 {
            
            let tip = tips[0]
            tipLabel?.text = tip.text
        }
            // download image
    }
    
}

