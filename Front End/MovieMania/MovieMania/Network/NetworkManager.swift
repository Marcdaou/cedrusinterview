//
//  NetworkManager.swift
//  MovieMania
//
//  Created by Unisoft on 3/15/21.
//

import Foundation
import Alamofire


class NetworkManager {
    
    static var shared : NetworkManager = NetworkManager()
    private var baseUrl = "http://localhost:8080/movies"
    
    
    //    func login(success: @escaping (_ user: User) -> Void, failure: @escaping (_ error : String) -> Void) {
    //
    //    }
    
    
    //    func register(success: @escaping (_ user: User) -> Void, failure: @escaping (_ error : String) -> Void) {
    //
    //    }
    
    
    func getMovies(success: @escaping (_ movies : [Movie]) -> Void, failure: @escaping (_ error : String) -> Void) {
        
        let request = AF.request(baseUrl)
        
        request.responseDecodable(of: [Movie].self) { (data) in
            
            if let error = data.error {
                failure(error.localizedDescription)
            } else {
                guard let movies = data.value else { return }
                success(movies)
            }
        }
    }
    
    func getMovies(searchStr: String, sort: String, success: @escaping (_ movies : [Movie]) -> Void, failure: @escaping (_ error : String) -> Void) {
        
        let request = AF.request("\(baseUrl)/\(searchStr)/\(sort)")
        
        request.responseDecodable(of: [Movie].self) { (data) in
            
            if let error = data.error {
                failure(error.localizedDescription)
            } else {
                guard let movies = data.value else { return }
                success(movies)
            }
        }
    }
    
    func addNewMovie(movie: Movie, success: @escaping (_ movie : Movie) -> Void, failure: @escaping (_ error : String) -> Void) {
        
        let request = AF.request(baseUrl, method: HTTPMethod.post ,parameters: movie.dict)
        request.responseDecodable(of: Movie.self) { (data) in
            if let error = data.error {
                failure(error.localizedDescription)
            } else {
                guard let movie = data.value else { return }
                success(movie)
            }
        }
    }
    
    func updateMovie(movie: Movie, success: @escaping (_ movie : Movie) -> Void, failure: @escaping (_ error : String) -> Void) {
        
        let request = AF.request("\(baseUrl)/\(movie.id ?? "")", method: HTTPMethod.put ,parameters: movie.dict)
        request.responseDecodable(of: Movie.self) { (data) in
            if let error = data.error {
                failure(error.localizedDescription)
            } else {
                guard let movie = data.value else { return }
                success(movie)
            }
        }
    }
    
    func deleteMovie(mid: String, success: @escaping (_ movieId : String) -> Void, failure: @escaping (_ error : String) -> Void) {
        
        let request = AF.request("\(baseUrl)/\(mid)", method: HTTPMethod.delete)
        request.responseDecodable(of: Movie.self) { (data) in
            if let error = data.error {
                failure(error.localizedDescription)
            } else {
                success(mid)
            }
        }
    }
    
}


extension Encodable {

    var dict : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
        return json
    }
}
