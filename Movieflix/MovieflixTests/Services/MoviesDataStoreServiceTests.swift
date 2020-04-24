//
//  MoviesDataStoreImplementation.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/23/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import XCTest
@testable import Movieflix

class MoviesDataStoreServiceTests: XCTestCase {
    var mockDataStore: MockDataStore!
    var subject: MoviesDataStoreService<MockDataStore>!
    
    override func setUp() {
        mockDataStore = MockDataStore()
        subject = MoviesDataStoreService(dataStore: mockDataStore)
    }

    func test_getMovies_dataStoreCallsElements() {
        let _ = subject.getMovies()
        
        XCTAssertEqual(mockDataStore.numberOfElementsInvokations, 1)
    }
    
    func test_getMovie_dataStoreCallsElementWithCorrectID() {
        let offer = subject.getMovie(id: "bob ross")
        
        XCTAssertNil(offer)
        XCTAssertEqual(mockDataStore.lastElementId, "bob ross")
        XCTAssertEqual(mockDataStore.numberOfElementInvokations, 1)
    }

}
