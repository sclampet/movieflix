//
//  MoviesService.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/23/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

protocol MoviesService {
    func getMovies(completion: @escaping ([String: [Movie]]) -> Void)
    func getMovie(id: String) -> Movie?
    func updateMovies(movies: [String: [Movie]])
}
