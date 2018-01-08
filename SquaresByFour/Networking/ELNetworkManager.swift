//
//  ELNetworkManager.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation
import UIKit

class ELNetworkManager {
 
    func getFourSquareURLFor(_ parameter: String, _ location: String) -> URL? {
        return URL(string:"https://api.foursquare.com/v2/venues/explore?\(parameter)=\(location)&limit=25&client_id=\(ELFourSquareCodes.clientId)&client_secret=\(ELFourSquareCodes.clientSecret)&v=20180110")
    }
    
    func requestItemsFor(_ parameter: String, _ location: String, completion: @escaping (String?, FourSquareItemsArray?) -> Void) {
        guard let url = getFourSquareURLFor(parameter, location) else { completion(nil, nil); return }
        
        ELFetchServices().fetchFourSquareServiceItems(url: url, completion: { (headerLocation, fourSquareItems) in

            if let items = fourSquareItems {
                completion(headerLocation, items)
            } else {
                completion(nil, nil)
            }
        })
    }
    
    func requestImageFor(_ url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        ELFetchServices().fetchImageDataService(url) { (image, error) in
            completion(image, error)
        }
    }
}
