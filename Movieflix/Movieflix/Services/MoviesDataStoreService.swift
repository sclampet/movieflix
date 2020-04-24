//
//  MoviesDataStoreImplementation.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/23/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

class MoviesDataStoreService<T: DataStore>: MoviesService where T.T == Movie {
    private let dataStore: T
    
    init(dataStore: T) {
        self.dataStore = dataStore
    }
    
    func getMovies() -> [Movie] {
        return dataStore.elements()
    }
    
    func getMovie(id: String) -> Movie? {
        return dataStore.element(id: id)
    }
}
