//
//  AddMovieCell.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import UIKit
import Kingfisher

class AddMovieCell: UITableViewCell {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    
    func populate(movie: Movie) {
        
        movieTitle.text = movie.name
        movieDescription.text = movie.description
        
        let url = URL(string: movie.image1Url)
        movieImg.kf.setImage(with: url)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
