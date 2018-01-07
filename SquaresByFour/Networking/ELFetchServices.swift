//
//  ELFetchServices.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation
import UIKit

class ELFetchServices {
    
    
    func fetchFourSquareServiceItems(url: URL, completion: @escaping (FourSquareItemsArray?) -> Void) {
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            guard error == nil else {
                print("Error while fetching image data: \(error!)")
                completion(nil)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive good data")
                completion(nil)
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(FourSquareResponse.self, from: responseData)
                
                let groups  = decoded.response.groups
                
                if groups.count > 0 {
                    completion(groups[0].items)
                    return
                } else {
                    completion(nil)
                }
            } catch {
                print("Error trying to convert the responseData to JSON using DeCodable")
                completion(nil)
                return
            }
        }
        task.resume()
    }
}
