//
//  MoviesHttpService.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

class MoviesHttpService: MoviesService {
    private let httpClient: HttpClient
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func getMovies() -> [Movie] {
        var movies: [Movie] = []
        let url = URLs.getMovies.url()
        
        httpClient.get(url: url) { (data, response, error) in
            if let error = error {
                print("error getting movies: \(error.localizedDescription)")
                return
            }
            
            if let responseData = data {
                if let requestResponse = response as? HTTPURLResponse {
                    if requestResponse.statusCode == 200 {
                        if let parsedMovies = try? JSONDecoder().decode([Movie].self, from: responseData) {
                            movies = parsedMovies
                            return
                        }
                    }
                }
            }
        }
        
        return movies
    }
    
    func getMovie(id: String) -> Movie? {
        return nil
    }
}
