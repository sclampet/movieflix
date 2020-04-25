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
    
    func test_getMovies_httpClientCallsGetAndCorrectlyParsesJSON() {
        let dummyMovie = ["id": "", "title": "", "overview": ""]
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
        }
        
        XCTAssertTrue(didCallGetMoviesCallback)
        XCTAssertEqual(mockHttpClient.numberOfGetInvokations, 1)
        XCTAssertEqual(mockHttpClient.lastURL!.pathComponents[3], "popular")
    }

}
