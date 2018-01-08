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
    @IBOutlet weak var noImageLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    
    let networkManager = ELNetworkManager()
    var item : FourSquareItem?

    lazy var activityIndicator : UIActivityIndicatorView = {
        
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicator.color = UIColor.blue
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        activityIndicator.frame = CGRect(x: screenSize.width/2 - 25,
                                         y: screenSize.height/2 - 100,
                                         width: 50.0,
                                         height: 50.0)
        
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noImageLabel?.isHidden = true
        self.title = item?.venue.name
        
        if let tips = item?.tips,
            tips.count > 0 {
            
            let tip = tips[0]
            tipLabel?.text = tip.text
            
            if let imageUrl = tip.photourl {
                downloadImageFor(imageUrl)
            } else {
                noImageLabel?.isHidden = false
            }
        } else {
            tipLabel?.text = "This location doesn't have additional interesting information to share with you."
        }
    }

    func downloadImageFor(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        networkManager.requestImageFor(url) { [weak self] (image, error) in
            DispatchQueue.main.async { () in
                self?.activityIndicator.stopAnimating()
            }
            guard error == nil else {
                print(error?.localizedDescription ?? "Error in image request")
                return
            }
            
            guard let image = image else { return }
            
            DispatchQueue.main.async { () in
                self?.imageView?.image = image
            }
        }
    }
}
