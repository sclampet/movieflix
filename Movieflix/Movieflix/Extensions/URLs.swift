//
//  URL.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

enum URLs {
    case getPopularMovies
    case getNowPlayingMovies
    case getLatestMovies
    case getTopRatedMovies

    func url() -> URL {
        let queryParams: [String: String] = [
            "api_key": APIKey
        ]
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.setQueryItems(with: queryParams)

        switch self {
            case .getPopularMovies: components.path = "/3/movie/popular"
            case .getNowPlayingMovies: components.path = "/3/movie/now_playing"
            case .getLatestMovies: components.path = "/3/movie/latest"
            case .getTopRatedMovies: components.path = "/3/movie/top_rated"
        }

        guard let url = components.url else {
            fatalError("Invalid URL")
        }

        return url
    }}
