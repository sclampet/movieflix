//
//  MoviesDataStoreService.swift
//  Movieflix
//
//  Created by Scott Clampet on 5/9/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

class MoviesDataStoreService<T: DataStore>: MoviesService where T.T == Movie {
    private let dataStore: T
    
    init(dataStore: T) {
        self.dataStore = dataStore
    }
    
    func getMovies(completion: @escaping ([String : [Movie]]) -> Void) {
        if let movies = dataStore.elements() {
            completion(movies)
        }
        else {
            completion([:])
        }
    }
    
    func getMovie(id: String) -> Movie? {
        return nil
    }
    
    func updateMovies(movies: [String : [Movie]]) {
        dataStore.updateElements(elements: movies)
    }
}
