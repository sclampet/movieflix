//
//  HomeView.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class HomeView: UIView {
    private let movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
        
        super.init(frame: .zero)
        
        backgroundColor = .blue
        print(self.movies)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
