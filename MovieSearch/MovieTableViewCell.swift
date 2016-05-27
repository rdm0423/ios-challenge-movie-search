//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Ross McIlwaine on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    var movie: Movie?
    
    func setupCellWithMovies(movie: Movie) {
        
        self.movie = movie
        
        titleLabel.text = movie.title
        ratingLabel.text = "Vote Avg: \(movie.voteAverage)"
        summaryLabel.text = movie.overview
        posterImageView.image = UIImage()
        
        ImageController.fetchImage(movie.posterPathURL) { (image) in
            dispatch_async(dispatch_get_main_queue(), {
                self.posterImageView.image = image
            })
        }
        
    }
    
    
}
