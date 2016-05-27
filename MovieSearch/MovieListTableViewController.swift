//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Ross McIlwaine on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {

//    var searchResultMovies = [Movie]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    
    // MARK: - Search Bar
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let searchText = searchBar.text ?? ""
        
        MovieController.fetchMoviesFromSearch(searchText) { (movies) in
            
            dispatch_async(dispatch_get_main_queue(), {
                
                MovieController.sharedController.movies = movies
                
                self.tableView.reloadData()
            })
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.sharedController.movies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieTableViewCell
        
        let movie = MovieController.sharedController.movies[indexPath.row]
        
        cell?.setupCellWithMovies(movie)

        return cell ?? UITableViewCell()
    }
}
