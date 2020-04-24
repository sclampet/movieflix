//
//  MockHttpClient.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation
@testable import Movieflix

class MockHttpClient: HttpClient {
    var nextData: Data?
    var nextResponse: URLResponse?
    var nextError: Error?
    
    var numberOfGetInvokations = 0
    var lastURL: URL?
    func get(url: URL, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
        callback(nextData, nextResponse, nextError)
        numberOfGetInvokations += 1
        lastURL = url
    }
}
