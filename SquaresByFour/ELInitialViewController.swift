//
//  ELInitialViewController.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import UIKit
import CoreLocation

class ELInitialViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var findByInputTextField: UITextField!
    
    let networkManager = ELNetworkManager()
    let locationManager = CLLocationManager()
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
        
        decorateButton()
    }
    
    func decorateButton() {
        let text = ((CLLocationManager.authorizationStatus() == .authorizedWhenInUse) ? searchByLocationButtonTitle : searchByInputButtonTitle)
        searchButton.setTitle(text, for: .normal)
    }
    
    // MARK: - IBAction -
    @IBAction func searchTapped(sender: UIButton) {
        self.findByInputTextField.resignFirstResponder()
        
        if let input = self.findByInputTextField.text,
            input != "" {
            networkRequestItemsFor(parameter: "near", location: input.removingWhitespaces())
        }
        
        //getCurrentLocation()
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
    
    // MARK: - Location Manager Delegate -
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let gpsLocation:CLLocationCoordinate2D = locations.last?.coordinate {
            print(gpsLocation)
        }

        locationManager.stopUpdatingLocation()
        // set a flag so segue is only called once
//        if flag {
//            flag = false
//            performSegue(withIdentifier: "showSearch", sender: self)
//        }
    }
    
    // MARK: - Text Field Delegate -
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text,
            text != "" {
            
            print(text)
        }
    }

}

