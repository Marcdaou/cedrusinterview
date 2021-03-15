//
//  MovieCell.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import UIKit
import Cosmos
import Kingfisher

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieImage1: UIImageView!
    @IBOutlet weak var movieImage2: UIImageView!
    
    @IBOutlet weak var topActor: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var trend: UILabel!
    
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var opinion: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        opinion.setTitleColor(.black, for: .normal)
    }
    
    var movie: Movie!
    
    @IBAction func saveChanges(_ sender: Any) {
        NetworkManager.shared.updateMovie(movie: movie) { (movieCreated) in
            print("Movie updated successfully")
        } failure: { (error) in
            print("Error updating movie")
        }
    }
    
    func populate(movie: Movie) {
        
        self.movie = movie
        
        movieTitle.text = movie.name
        movieGenre.text = movie.genre
        movieDescription.text = movie.description
        topActor.text = movie.topActor
        releaseDate.text = movie.releaseDate
        popularity.text = "Imdb \(movie.popularityScore ?? 0.0)"
        trend.text = "Trend \(movie.trendingScore ?? 0.0)%"
        rating.rating = movie.rating
        
        evaluateRating(rating: movie.rating)
        
        rating.didTouchCosmos = { rating in
            self.evaluateRating(rating: rating)
            
        }
        
        let url1 = URL(string: movie.image1Url)
        let url2 = URL(string: movie.image2Url)
        movieImage1.kf.setImage(with: url1)
        movieImage2.kf.setImage(with: url2)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func evaluateRating(rating:Double) {
        if rating < 4 {
            self.opinion.setTitle("Meh", for: .normal)
            self.opinion.backgroundColor = .red
        } else if rating < 7 {
            self.opinion.setTitle("Cool", for: .normal)
            self.opinion.backgroundColor = .yellow
        } else {
            self.opinion.setTitle("Love it!", for: .normal)
            self.opinion.backgroundColor = .green
        }
    }

}
