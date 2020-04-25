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
    
    func getMovies(completion: @escaping ([Movie]) -> Void)  {
        var movies: [Movie] = []
        let url = URLs.getMovies.url()
        
        httpClient.get(url: url) { data, response, _ in
            if let responseData = data {
                if let requestResponse = response as? HTTPURLResponse {
                    if requestResponse.statusCode == 200 {
                        if let json = try? JSONSerialization.jsonObject(with: responseData) as? [String: Any],
                            let jsonArray = json["results"] as? [[String:Any]] {
                            print(responseData)
                            jsonArray.forEach { object in
                                if let movie = Movie(json: object) {
                                    movies.append(movie)
                                }
                            }
                            completion(movies)
                        }
                    }
                }
            }
        }
    }
    
    func getMovie(id: String) -> Movie? {
        return nil
    }
}
