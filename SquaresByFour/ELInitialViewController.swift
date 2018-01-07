//
//  ELInitialViewController.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import UIKit

class ELInitialViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var findByInputTextField: UITextField!
    
    let networkManager = ELNetworkManager()
//    let locationManager = CLLocationManager()
//    var currentLocation:CLLocationCoordinate2D!
//    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
//        // set up location manager
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
    }
    
    @IBAction func searchTapped(sender: UIButton) {
        networkManager.requestItemsForLocation { (items) in
            if let items = items {
                print(items)
            } else {
                print("nEEEAH")
            }
        }
    }
    
//    // MARK: - Table View
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return objects.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let object = objects[indexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

