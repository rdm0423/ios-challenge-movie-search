//
//  Movie.swift
//  MovieSearch
//
//  Created by Ross McIlwaine on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

typealias JSON = [String: AnyObject]

struct Movie {
    
    private let idKey = "id"
    private let titleKey = "original_title"
    private let overviewKey = "overview"
    private let voteAverageKey = "vote_average"
    private let posterPathKey = "poster_path"
    
    let identifier: Int
    let title: String
    let overview: String
    let voteAverage: Double
    let posterPathURL: NSURL
    
    init?(json: JSON) {
        
        guard let identifier = json[idKey] as? Int,
            let title = json[titleKey] as? String,
            let overview = json[overviewKey] as? String,
            let voteAverage = json[voteAverageKey] as? Double,
            let posterPathURLString = json[posterPathKey] as? String,
            let posterPathURL = NSURL(string: "http://image.tmdb.org/t/p/w500/\(posterPathURLString)") else {
                return nil
        }
        self.identifier = identifier
        self.title = title
        self.overview = overview
        self.voteAverage = voteAverage
        self.posterPathURL = posterPathURL
        
    }
    
}