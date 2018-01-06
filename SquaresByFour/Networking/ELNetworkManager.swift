//
//  ELNetworkManager.swift
//  SquaresByFour
//
//  Created by Edan Lichtenstein on 1/5/18.
//  Copyright © 2018 Ruckt. All rights reserved.
//

import Foundation

class ELNetworkManager {
    
    func requestVenues(completion: @escaping ([String]?) -> Void) {
        
       // if forTextEntry == true {
//                    let url = "https://api.foursquare.com/v2/search/recommendations?ll=\(currentLocation.latitude),\(currentLocation.longitude)&v=20160607&intent=coffee&limit=15&client_id=\(client_id)&client_secret=\(client_secret)"
//
//            let url = "https://api.foursquare.com/v2/venues/explore?near=Philadelphia&oauth_token=QRG32ZJ2S5D0FN1OC5QL5OZUAXQX11KR41SFDF1ZY2NS5AP1&v=20180105
        let textLocation = "Philadelphia"
        let stringHTTP = "https://api.foursquare.com/v2/venues/explore?near=\(textLocation)&client_id=\(ELFourSquareCodes.clientId)&client_secret=\(ELFourSquareCodes.clientSecret)"
    //    }
        let url = URL(string: stringHTTP)
        
        ELFetchServices().fetchFourSquareService(url: url!, completion: { [weak self] (venuesArray) in

            if let venuesArray = venuesArray {
//                self?.requestImageDataForProfiles(characterProfiles, completion: { (venuesArray) in
                   completion(venuesArray)
//                })
                
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
