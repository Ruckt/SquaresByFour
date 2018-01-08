//
//  ELNetworkManager.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

class ELNetworkManager {
 
    func getFourSquareURLFor(_ parameter: String, _ location: String) -> URL? {
        return URL(string:"https://api.foursquare.com/v2/venues/explore?\(parameter)=\(location)&limit=25&client_id=\(ELFourSquareCodes.clientId)&client_secret=\(ELFourSquareCodes.clientSecret)&v=20180110")
    }
    
    func requestItemsFor(_ parameter: String, _ location: String, completion: @escaping (FourSquareItemsArray?) -> Void) {
        guard let url = getFourSquareURLFor(parameter, location) else { completion(nil); return }
        
        print("URL: \(url)")
        ELFetchServices().fetchFourSquareServiceItems(url: url, completion: { (fourSquareItems) in

            if let items = fourSquareItems {
                completion(items)
            } else {
                completion(nil)
            }
        })
    }
    
//    private func requestImageDataForProfiles(_ profileArray: ELCharacterProfileArray, completion: @escaping(_ profileImages: ELCharacterProfilelPlusImageDataArray) -> Void) {
//
//        var imagesArray = ELCharacterProfilelPlusImageDataArray()
//        imagesArray.reserveCapacity(profileArray.count)
//        var nonImageArray = ELCharacterProfilelPlusImageDataArray()
//        nonImageArray.reserveCapacity(profileArray.count)
//
//        let downloadGroup = DispatchGroup()
//        let queue = DispatchQueue(label: "requestImageData")
//
//        for profile in profileArray {
//
//            if let httpUrl = URL(string: profile.iconURL) {
//                queue.async(group:downloadGroup) {
//                    downloadGroup.enter()
//                    ELFetchServices().fetchImageDataService(httpUrl, completion: { (image) in
//
//                        let fetchQueue = DispatchQueue(label: "fetchQueue")
//                        fetchQueue.sync {
//                            if let image = image {
//                                imagesArray.append(ELCharacterProfilelPlusImageData(profile: profile, image: image))
//                            }
//                        }
//                        downloadGroup.leave()
//                    })
//                }
//            } else {
//                let image = UIImage(named:"selfie.png")
//                nonImageArray.append(ELCharacterProfilelPlusImageData(profile: profile, image: image))
//            }
//        }
//
//        downloadGroup.notify(queue: queue) {
//            completion(imagesArray + nonImageArray)
//        }
//    }
}
