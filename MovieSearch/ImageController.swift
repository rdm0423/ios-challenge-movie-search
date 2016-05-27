//
//  ImageController.swift
//  MovieSearch
//
//  Created by Ross McIlwaine on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ImageController {
    
    static let posterImageBaseURL = NSURL(string: " http://image.tmdb.org/t/p/w500/")
    
    static func fetchImage(url: NSURL, completion: (image: UIImage?) -> Void) {
        
        NetworkController.performRequest(url, httpMethod: .get) { (data, error) in
            
            if let data = data {
                let image = UIImage(data: data)
                completion (image: image)
            }
        }
    }
    
}