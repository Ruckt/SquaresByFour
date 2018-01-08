//
//  ELInitialViewController+DelegateMethods.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/7/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

extension ELInitialViewController: CLLocationManagerDelegate, UITextFieldDelegate {
    
    // MARK: - Location Manager Delegate -
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let gpsLocation:CLLocationCoordinate2D = locations.last?.coordinate {
            print(gpsLocation)
            
            let input = "\(gpsLocation.latitude),\(gpsLocation.longitude)"
            networkRequestItemsFor(parameter: "ll", location: input)
            return
        }
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            isLocationAuthorized = true
            setButtonTitle()
            break
        default:
            break
        }
    }
    
    // MARK: - Text Field Delegate -
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text,
            text != "" {
            
            print(text)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.findByInputTextField.resignFirstResponder()
        
        if let input = self.findByInputTextField.text,
            input != "" {
            networkRequestItemsFor(parameter: "near", location: input.removingWhitespaces())
        }
        return true
    }
}
