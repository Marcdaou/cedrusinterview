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
        
        
        var movies = [Movie]()
        let request = AF.request(baseUrl)
        
        request.responseDecodable(of: Movie.self) { (response) in
            guard let movies = response.value else { return }
            success
            
        }
    }
    
    func addNewMovie(movie: Movie, success: @escaping (_ movie : Movie) -> Void, failure: @escaping (_ error : String) -> Void) {
        
        
        let request = AF.request(baseUrl, method: HTTPMethod.post ,parameters: ["foo": "bar"])
        request.responseJSON { (data) in
            if let error = data.error {
                failure(error.localizedDescription)
            } else {
                success()
            }
            print(data)
            
        }
    }
}

