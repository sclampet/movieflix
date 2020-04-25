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
    
    init(navigationController: UINavigationController,
         moviesHttpService: MoviesHttpService) {
        self.navigationController = navigationController
        self.moviesHttpService = moviesHttpService
    }
    
    func start() {
        let vc = HomeViewController(moviesHttpService: moviesHttpService)
        navigationController.pushViewController(vc, animated: true)
    }
}
