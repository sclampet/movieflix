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
    let overview: String?
    let posterPath: String?
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let overview = json["overview"] as? String,
            let posterPath = json["poster_path"] as? String else {
                return nil
        }
        
        self.id = String(id)
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
    }
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath
    }
}
