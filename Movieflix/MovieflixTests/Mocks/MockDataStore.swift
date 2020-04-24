//
//  MockDataStore.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/23/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

@testable import Movieflix

class MockDataStore: DataStore {
    typealias T = Movie
    
    var numberOfElementsInvokations = 0
    var stubbedElements: [T] = []
    func elements() -> [T] {
        numberOfElementsInvokations += 1
        return stubbedElements
    }
    
    var numberOfElementInvokations = 0
    var lastElementId = ""
    var stubbedElement: T? = nil
    func element(id: String) -> T? {
        numberOfElementInvokations += 1
        lastElementId = id
        return stubbedElement
    }
}
