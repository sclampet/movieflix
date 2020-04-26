//
//  MoviesHttpServiceTests.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import XCTest
@testable import Movieflix

class MoviesHttpServiceTests: XCTestCase {
    
    func test_getMovies_httpClientCallsGetForEachMovieTypeAndCorrectlyParsesJSON() {
        let dummyMovie = ["id": "", "title": "", "overview": ""]
        let expectation = self.expectation(description: "getMovies")
        let happyHTTPResponse = HTTPURLResponse(
            url: URL(string: "www.googles.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: [:]
        )
        
        let mockHttpClient = MockHttpClient()
        mockHttpClient.nextResponse = happyHTTPResponse
        mockHttpClient.nextData = try? JSONEncoder().encode([
            "results": [
                dummyMovie,
                dummyMovie
            ]
        ])
        var didCallGetMoviesCallback = false
        
        let subject = MoviesHttpService(httpClient: mockHttpClient)
        
        subject.getMovies { result in
            didCallGetMoviesCallback = true
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 10)

        XCTAssertTrue(didCallGetMoviesCallback)
        XCTAssertEqual(mockHttpClient.numberOfGetInvokations, 4)
        XCTAssertEqual(mockHttpClient.lastURL![0].pathComponents[3], "popular")
        XCTAssertEqual(mockHttpClient.lastURL![1].pathComponents[3], "latest")
        XCTAssertEqual(mockHttpClient.lastURL![2].pathComponents[3], "now_playing")
        XCTAssertEqual(mockHttpClient.lastURL![3].pathComponents[3], "top_rated")
    }

}
