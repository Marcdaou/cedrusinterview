//
//  AddMoviesVC.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import UIKit

class AddMoviesVC: UIViewController {


    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!

    private var movies: [Movie] = [Movie.init(id: "abc", name: "Die Hard", image1Url: "https://dyn.media.titanbooks.com/ucCksQbH5p8HNpMIyITqHwA2e_I=/fit-in/600x600/https://media.titanbooks.com/catalog/products/DieHard_UVH.jpg",image2Url: "" ,genre: "Comedy/ Action", description: "Die Hard is film's equivalent of a terrorist attack on your senses, but Willis' intensity and presence push it into guilty pleasure territory.", rating: 3, trendingScore: 94, popularityScore: 8.2, releaseDate: "1988", topActor: "Bruce Willis")]
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never

    }

    @objc func actionAdd(_ sender: UIButton) {
        
        

    }
}

extension AddMoviesVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddMovieCell
        
        cell.populate(movie: movies[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 110
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        actionAdd(UIButton())
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .normal, title: nil) { (action, view, completionHandler) in
            print(#function)
            completionHandler(true)
        }
        if #available(iOS 13.0, *) {
            deleteAction.image = UIImage(systemName: "trash.fill")
        } else {
        }
        deleteAction.backgroundColor = UIColor.systemGray

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
