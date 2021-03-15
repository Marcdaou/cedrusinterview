//
//  Movie.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import Foundation



public class Movie: Decodable {
    
    var id: String!
    var name: String!
    var genre: String!
    var image1Url: String!
    var image2Url: String!
    var description: String!
    var rating: Double!
    var trendingScore: Double!
    var popularityScore: Double!
    var releaseDate: String!
    var topActor: String!
    
    init(id: String, name: String, image1Url:String, image2Url:String, genre: String,
         description: String, rating: Double, trendingScore: Double,
         popularityScore: Double, releaseDate: String, topActor:String) {
        
        self.id = id
        self.name = name
        self.description = description
        self.image1Url = image1Url
        self.image2Url = image2Url
        self.genre = genre
        self.rating = rating
        self.trendingScore = trendingScore
        self.popularityScore = popularityScore
        self.releaseDate = releaseDate
        self.topActor = topActor
        
    }
}
