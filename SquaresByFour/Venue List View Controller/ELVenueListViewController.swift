//
//  ELVenueListViewController.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/7/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation
import UIKit

class ELVenueListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var venuesList = FourSquareItemsArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        for item in venuesList {
            print("*******")
            print(item.venue.name)
        }
    }
    
    
    // MARK: - TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venuesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }

        let item = venuesList[indexPath.row]
        cell.textLabel?.text = item.venue.name
//        cell.rating.text = String(format: "%.1f", searchResults[(indexPath as NSIndexPath).row]["venue"]["rating"].doubleValue) + "⭐️"
//        cell.distance.text = "\(searchResults[(indexPath as NSIndexPath).row]["venue"]["location"]["distance"].intValue)m"
//        cell.address.text = searchResults[(indexPath as NSIndexPath).row]["venue"]["location"]["address"].string
//
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // show the DetailController
//        performSegue(withIdentifier: "details", sender: self)
//    }
    
    
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // check if segue is to the DetailsController
//        if segue.identifier == "details" {
//
//            let vc = segue.destination as! DetailsController
//            let selectedCell = tableView.indexPathForSelectedRow!
//
//            // Set the title on the details controller and deselect tableview cell
//            vc.venueName = searchResults[(selectedCell as NSIndexPath).row]["venue"]["name"].string
//            let lat = searchResults[(selectedCell as NSIndexPath).row]["venue"]["location"]["lat"].doubleValue
//            let lng = searchResults[(selectedCell as NSIndexPath).row]["venue"]["location"]["lng"].doubleValue
//            vc.location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
//            vc.venueId = searchResults[(selectedCell as NSIndexPath).row]["venue"]["id"].stringValue
//
//            tableView.deselectRow(at: selectedCell, animated: false)
//        }
//    }
}
