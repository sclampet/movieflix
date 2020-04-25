//
//  HomeViewControllerTests.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import XCTest
@testable import Movieflix

class HomeViewControllerTests: XCTestCase {
    func test_init_moviesHttpServiceShouldCallGetMovies() {
        let mockMoviesHttpService = MockMoviesHttpService(httpClient: MockHttpClient())
        let subject = HomeViewController(moviesHttpService: mockMoviesHttpService)
        
        subject.loadView()
        
        XCTAssertEqual(mockMoviesHttpService.numberOfGetMoviesInvokations, 1)
    }

}
