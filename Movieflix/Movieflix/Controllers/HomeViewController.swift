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
    var movies: [String: [Movie]] = [:] {
        didSet {
            DispatchQueue.main.async {
                self.primaryView = HomeView(movies: self.movies)
                self.loadView()
            }
        }
    }
    
    // MARK: Private
    private var primaryView: HomeView?
    private let moviesHttpService: MoviesHttpService
    private let moviesDataStoreService: MoviesService
    
    init(moviesHttpService: MoviesHttpService, moviesDataStoreService: MoviesService) {
        self.moviesHttpService = moviesHttpService
        self.moviesDataStoreService = moviesDataStoreService
        
        super.init(nibName: nil, bundle: nil)
        
        //Make sure we have movies before loading the view
        moviesDataStoreService.getMovies(completion: { movies in
            if movies.count > 0 {
                self.movies = movies
            }
            else {
                moviesHttpService.getMovies { [weak self] movies in
                    guard let myself = self else { return }
                    
                    myself.movies = movies
                    moviesDataStoreService.updateMovies(movies: movies)
                }
            }
        })
    }
    
    override func loadView() {
        self.primaryView = HomeView(movies: self.movies)
        self.view = primaryView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.edgesForExtendedLayout = .all
        navigationController?.navigationBar.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
