//
//  MainCoordinator.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    private let moviesHttpService: MoviesHttpService
    private let moviesDataStoreService: MoviesService
    
    init(navigationController: UINavigationController,
         moviesHttpService: MoviesHttpService,
         moviesDataStoreService: MoviesService) {
        self.navigationController = navigationController
        self.moviesHttpService = moviesHttpService
        self.moviesDataStoreService = moviesDataStoreService
    }
    
    func start() {
        let vc = HomeViewController(moviesHttpService: moviesHttpService,
                                    moviesDataStoreService: moviesDataStoreService)
        navigationController.pushViewController(vc, animated: true)
    }
}
