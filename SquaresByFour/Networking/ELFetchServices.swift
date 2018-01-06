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
    
    
    func fetchFourSquareService(url: URL, completion: @escaping ([String]?) -> Void) {
        
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
            print("************")
            print(responseData)
            print("************")
            print(urlResponse!)
            print("************")
            
            completion(nil)
//            do {
//                let decoded = try JSONDecoder().decode(ELRelatedTopics.self, from: responseData)
//                let characterProfiles = decoded.RelatedTopics
//                completion(characterProfiles)
//                
//            } catch {
//                print("Error trying to convert the responseData to JSON using DeCodable")
//                completion(nil)
//                return
//            }
        }
        task.resume()
    }
}
