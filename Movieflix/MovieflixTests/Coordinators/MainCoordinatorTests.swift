//
//  MainCoordinatorTests.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import XCTest
@testable import Movieflix

class MainCoordinatorTests: XCTestCase {

    func test_start_mainCoordinatorPushesHomeViewControllerOnNavigationStack() {
        let mockNavigationController = MockNavigationController()
        let mockMoviesHttpService = MockMoviesHttpService(httpClient: MockHttpClient())
        let subject = MainCoordinator(navigationController: mockNavigationController,
                                      moviesHttpService: mockMoviesHttpService)
        
        subject.start()
        
        XCTAssert(mockNavigationController.lastPushedVC is HomeViewController)
    }

}
