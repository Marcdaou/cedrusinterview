//
//  MoviesVC.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import UIKit

class MoviesVC: UIViewController {
    
    var selectedIndex = -1
    
    var movies: [Movie] = [Movie.init(id: "abc", name: "Die Hard", image1Url: "https://dyn.media.titanbooks.com/ucCksQbH5p8HNpMIyITqHwA2e_I=/fit-in/600x600/https://media.titanbooks.com/catalog/products/DieHard_UVH.jpg",image2Url: "" ,genre: "Comedy/ Action", description: "Die Hard is film's equivalent of a terrorist attack on your senses, but Willis' intensity and presence push it into guilty pleasure territory.", rating: 3, trendingScore: 94, popularityScore: 8.2, releaseDate: "1988", topActor: "Bruce Willis")]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.present(SortByView(), animated: true, completion: nil)

    }
}

extension MoviesVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieCell
        cell.populate(movie: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 470
        }
        return 79
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    
    
    
}

