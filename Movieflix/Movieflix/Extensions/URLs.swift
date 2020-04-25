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
    case getMovies

    func url() -> URL {
        let queryParams: [String: String] = [
            "api_key": APIKey
        ]
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.setQueryItems(with: queryParams)

        switch self {
            case .getMovies: components.path = "/3/movie/popular"
        }

        guard let url = components.url else {
            fatalError("Invalid URL")
        }

        return url
    }}
