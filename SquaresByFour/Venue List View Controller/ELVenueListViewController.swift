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
        tableView.rowHeight = 70.0
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ELVenueTableVCCell.kCellIdentifier) as? ELVenueTableVCCell else { return UITableViewCell() }

        let item = venuesList[indexPath.row]
        cell.venueNameLabel?.text = item.venue.name
        
        if let distance = item.venue.location.distance {
            cell.disatanceLabel?.text = ("\(distance)m")
        }

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "detailsVC",
            let detailsVC = segue.destination as? ELDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
            detailsVC.item = self.venuesList[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}
