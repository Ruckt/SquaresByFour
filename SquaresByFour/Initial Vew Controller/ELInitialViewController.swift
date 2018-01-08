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
    var shouldPerformSegue = true
    var itemsArray = FourSquareItemsArray()
    var headerLocation = "Where are you?"
    
    let searchByInputButtonTitle = "Search Your WorldWide Location"
    let searchByLocationButtonTitle = "Search Near You"
    
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

        findByInputTextField.delegate = self
        findByInputTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        searchButton.layer.cornerRadius = 5
        searchButton.layer.borderWidth = 0
        setButtonTitle(searchByGPS: isLocationAuthorized)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shouldPerformSegue = true
    }

    // MARK: - UI -
    
    func setButtonTitle(searchByGPS: Bool) {
        let text = (searchByGPS ? searchByLocationButtonTitle : searchByInputButtonTitle)
        searchButton.setTitle(text, for: .normal)
        searchButton.setNeedsLayout()
        searchButton.reloadInputViews()
    }
    
    // MARK: - IBAction -
    @IBAction func searchTapped(sender: UIButton) {
         self.searchButton.isEnabled = true
        self.findByInputTextField.resignFirstResponder()
        
        if let input = self.findByInputTextField.text,
            input != "" {
            networkRequestItemsFor(parameter: "near", location: input.removingWhitespaces())
            return
        } else if isLocationAuthorized {
            getCurrentLocation()
        } else {
            showAlert()
            self.searchButton.isEnabled = false
        }
    }
    
    func networkRequestItemsFor(parameter: String, location: String) {
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        networkManager.requestItemsFor(parameter, location, completion: { [weak self] (headerLocation, items) in
            
            DispatchQueue.main.async { () in
                
                self?.searchButton.isEnabled = true
                
                if self?.activityIndicator.isAnimating == true {
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.removeFromSuperview()
                }
            
                if let items = items {
                    self?.itemsArray = items
                    if let location = headerLocation {
                        self?.headerLocation = location
                    }
                    self?.performSegue(withIdentifier: "venuesListVC", sender: self)
                } else {
                    print("Some sort of network request failure, try again.")
                }
            }
        })
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "venuesListVC",
            let venuesVC = segue.destination as? ELVenueListViewController {
            venuesVC.venuesList = itemsArray
            venuesVC.title = headerLocation
        }
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
