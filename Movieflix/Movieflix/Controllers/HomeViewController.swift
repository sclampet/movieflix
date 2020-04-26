//
//  HomeViewController.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: Exposed
    
    // MARK: Private
    private var movies: [String: [Movie]] = [:]
    private var primaryView: HomeView?
    private let moviesHttpService: MoviesHttpService
    
    init(moviesHttpService: MoviesHttpService) {
        self.moviesHttpService = moviesHttpService
        
        super.init(nibName: nil, bundle: nil)
        
        //Make sure we have movies before loading the view
        let group = DispatchGroup()
        group.enter()
        moviesHttpService.getMovies { [weak self] movies in
            guard let myself = self else { return }
            
            myself.movies = movies
            group.leave()
        }

        group.wait()
    }
    
    override func loadView() {
        primaryView = HomeView(movies: self.movies)
        self.view = primaryView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
