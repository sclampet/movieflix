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
        let happyHTTPResponse = HTTPURLResponse(
            url: URL(string: "www.googles.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: [:]
        )
        
        let mockHttpClient = MockHttpClient()
        mockHttpClient.nextResponse = happyHTTPResponse
        mockHttpClient.nextData = try? JSONEncoder().encode([
            Movie(id: "", title: "", overview: "", posterPath: "", composedPosterPath: ""),
            Movie(id: "", title: "", overview: "", posterPath: "", composedPosterPath: ""),
            Movie(id: "", title: "", overview: "", posterPath: "", composedPosterPath: ""),
            Movie(id: "", title: "", overview: "", posterPath: "", composedPosterPath: ""),
        ])
        
        let subject = MoviesHttpService(httpClient: mockHttpClient)
        
        let retrievedMovies = subject.getMovies()
        
        XCTAssertEqual(mockHttpClient.numberOfGetInvokations, 1)
        XCTAssertEqual(mockHttpClient.lastURL!.pathComponents[1], "popular")
        XCTAssertEqual(retrievedMovies.count, 4)
    }

}
