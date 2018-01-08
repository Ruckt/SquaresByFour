//
//  ELInitialViewController.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class ELInitialViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var findByInputTextField: UITextField!
    
    let networkManager = ELNetworkManager()
    let locationManager = CLLocationManager()
    var isLocationAuthorized = false
//    var currentLocation:CLLocationCoordinate2D!
//    var flag = true
    
    let searchByInputButtonTitle = "Search Your WorldWide Location"
    let searchByLocationButtonTitle = "Search Near You"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        findByInputTextField.delegate = self
        findByInputTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        searchButton.layer.cornerRadius = 5
        searchButton.layer.borderWidth = 0
        setButtonTitle()
    }

    // MARK: - UI -
    
    func setButtonTitle() {
        let text = (isLocationAuthorized ? searchByLocationButtonTitle : searchByInputButtonTitle)
        searchButton.setTitle(text, for: .normal)
        searchButton.setNeedsLayout()
        searchButton.reloadInputViews()
    }
    
    // MARK: - IBAction -
    @IBAction func searchTapped(sender: UIButton) {
        self.findByInputTextField.resignFirstResponder()
        
        if let input = self.findByInputTextField.text,
            input != "" {
            networkRequestItemsFor(parameter: "near", location: input.removingWhitespaces())
            return
        } else if isLocationAuthorized {
            getCurrentLocation()
        } else {
            showAlert()
        }
    }
    
    func networkRequestItemsFor(parameter: String, location: String) {
        
        networkManager.requestItemsFor(parameter, location, completion: { (items) in
            if let items = items {
                for item in items {
                    print("*******")
                    print(item.venue.name)
                }
            } else {
                print("Some sort of network request failure, try again.")
            }
        })
    }
    
    // MARK: - Location Methods -
    
    func getCurrentLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - Alerts -
    func showAlert() {
        let alert = UIAlertController(title: "More Information", message: "Enter your worldwide location or authorize location services.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
