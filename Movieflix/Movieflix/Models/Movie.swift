//
//  Movie.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/23/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

struct Movie: Codable & Idable {
    let id: String
    let title: String
    let overview: String
    let posterPath: String
    let composedPosterPath: String
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath
        case composedPosterPath
    }
}
