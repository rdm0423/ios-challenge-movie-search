//
//  MovieController.swift
//  MovieSearch
//
//  Created by Ross McIlwaine on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let sharedController = MovieController()
    
    static let baseURL = NSURL(string: "http://api.themoviedb.org/3/search/movie") ?? NSURL()
    static let apiKey = "45f6a670fcaca4d01e084a04f9039e30"
    static var movieSearchEndPoint = "/search/movie"
    
//    static var urlForSearch = NSURL(string: "https://api.themoviedb.org/3/search/movie?api_key=45f6a670fcaca4d01e084a04f9039e30&query=")!
    
    var movies: [Movie] = []
    
    static func fetchMoviesFromSearch(searchText: String, completion: (movies: [Movie]) -> Void) {
        
        
        let parameters: [String : String] = [
            "api_key": "45f6a670fcaca4d01e084a04f9039e30",
            "query": searchText.lowercaseString
        ]
        
//        let userSearchString = searchText
//        
//        //        let searchedURL = urlForSearch?.URLByAppendingPathComponent(userSearchString)
//        let searchedURL = NSURL(string: "\(urlForSearch)\(userSearchString)")
//        
//        
//        guard let newURL = searchedURL else {
//            fatalError("URL IS BROKEN")
//        }
        
      
        
        NetworkController.performRequest(baseURL, httpMethod: .get, urlParameters: parameters, body: nil) { (data, error) in
            
            
            
            if error != nil {
                completion(movies: [])
            }
            
            guard let data = data,
                let rawJSON = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
                let jsonDictionary = rawJSON as? [String: AnyObject],
                let resultDictionary = jsonDictionary["results"] as? [[String:AnyObject]] else {
                    completion(movies: [])
                    return
            }
            
            let movies = resultDictionary.flatMap({Movie(json: $0)})
            
            completion(movies: movies)

        }
        completion(movies: [])
    }
    
}