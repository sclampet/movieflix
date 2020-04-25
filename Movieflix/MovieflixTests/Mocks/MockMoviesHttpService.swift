//
//  MockMoviesHttpService.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

@testable import Movieflix

class MockMoviesHttpService: MoviesHttpService {
    var numberOfGetMoviesInvokations = 0
    override func getMovies(completion: @escaping ([Movie]) -> Void) {
        numberOfGetMoviesInvokations += 1
    }
    
    var numberOfGetMovieInvokations = 0
    var stubbedMovie: Movie? = nil
    override func getMovie(id: String) -> Movie? {
        numberOfGetMovieInvokations += 1
        return stubbedMovie
    }
}
