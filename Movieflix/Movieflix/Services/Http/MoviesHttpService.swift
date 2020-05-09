//
//  MoviesHttpService.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

class MoviesHttpService: MoviesService {
    private var movies: [String: [Movie]] = ["popular":[], "latest": [], "nowPlaying": [], "topRated": []]
    private let httpClient: HttpClient
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func getMovies(completion: @escaping ([String: [Movie]]) -> Void)  {
        
        let operationQueue = OperationQueue()
        
        let networkCalls = networkCallsBlockOperation()
        
        let completeOperation = BlockOperation { completion(self.movies) }
        completeOperation.addDependency(networkCalls)
        
        operationQueue.addOperation(networkCalls)
        operationQueue.addOperation(completeOperation)
    }
    
    func getMovie(id: String) -> Movie? {
        return nil
    }
    
    func updateMovies(movies: [String : [Movie]]) {}
}

extension MoviesHttpService {
    private func networkCallsBlockOperation() -> BlockOperation {
        let popular = URLs.getPopularMovies.url()
        let latest = URLs.getLatestMovies.url()
        let nowPlaying = URLs.getNowPlayingMovies.url()
        let topRated = URLs.getTopRatedMovies.url()
        
        return BlockOperation { [weak self] in
            guard let myself = self else { return }
            
            let dispatchGroup = DispatchGroup()
            
            //popular
            dispatchGroup.enter()
            myself.httpClient.get(url: popular) { data, response, _ in
                if let responseData = data {
                    if let requestResponse = response as? HTTPURLResponse {
                        if requestResponse.statusCode == 200 {
                            if let json = try? JSONSerialization.jsonObject(with: responseData) as? [String: Any] {
                                if let jsonArray = json["results"] as? [[String:Any]] {
                                    jsonArray.forEach { object in
                                        if let movie = Movie(json: object) {
                                            myself.movies["popular"]?.append(movie)
                                        }
                                    }
                                }
                                else {
                                    if let movie = Movie(json: json) {
                                        myself.movies["popular"]?.append(movie)
                                    }
                                }
                            }
                        }
                    }
                }
                dispatchGroup.leave()
            }
            
            //latest
            dispatchGroup.enter()
            myself.httpClient.get(url: latest) { data, response, _ in
                if let responseData = data {
                    if let requestResponse = response as? HTTPURLResponse {
                        if requestResponse.statusCode == 200 {
                            if let json = try? JSONSerialization.jsonObject(with: responseData) as? [String: Any] {
                                if let jsonArray = json["results"] as? [[String:Any]] {
                                    jsonArray.forEach { object in
                                        if let movie = Movie(json: object) {
                                            myself.movies["latest"]?.append(movie)
                                        }
                                    }
                                }
                                else {
                                    if let movie = Movie(json: json) {
                                        myself.movies["latest"]?.append(movie)
                                    }
                                }
                            }
                        }
                    }
                }
                dispatchGroup.leave()
            }
            
            //nowPlaying
            dispatchGroup.enter()
            myself.httpClient.get(url: nowPlaying) { data, response, _ in
                if let responseData = data {
                    if let requestResponse = response as? HTTPURLResponse {
                        if requestResponse.statusCode == 200 {
                            if let json = try? JSONSerialization.jsonObject(with: responseData) as? [String: Any] {
                                if let jsonArray = json["results"] as? [[String:Any]] {
                                    jsonArray.forEach { object in
                                        if let movie = Movie(json: object) {
                                            myself.movies["nowPlaying"]?.append(movie)
                                        }
                                    }
                                }
                                else {
                                    if let movie = Movie(json: json) {
                                        myself.movies["nowPlaying"]?.append(movie)
                                    }
                                }
                            }
                        }
                    }
                }
                dispatchGroup.leave()
            }
            
            //topRated
            dispatchGroup.enter()
            myself.httpClient.get(url: topRated) { data, response, _ in
                if let responseData = data {
                    if let requestResponse = response as? HTTPURLResponse {
                        if requestResponse.statusCode == 200 {
                            if let json = try? JSONSerialization.jsonObject(with: responseData) as? [String: Any] {
                                if let jsonArray = json["results"] as? [[String:Any]] {
                                    jsonArray.forEach { object in
                                        if let movie = Movie(json: object) {
                                            myself.movies["topRated"]?.append(movie)
                                        }
                                    }
                                }
                                else {
                                    if let movie = Movie(json: json) {
                                        myself.movies["topRated"]?.append(movie)
                                    }
                                }
                            }
                        }
                    }
                }
                dispatchGroup.leave()
            }

            dispatchGroup.wait()
        }
    }
}
