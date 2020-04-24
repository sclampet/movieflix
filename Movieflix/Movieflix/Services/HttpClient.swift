//
//  HttpClient.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

protocol HttpClient {
    func get(url: URL, callback: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class MoviesClient: HttpClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(url: URL, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                callback(nil, nil, error)
                return
            }
            
            if let responseData = data {
                if let requestResponse = response as? HTTPURLResponse {
                    if requestResponse.statusCode == 200 {
                        callback(responseData, requestResponse, nil)
                        return
                    } else if 400...500 ~= requestResponse.statusCode {
                        callback(nil, response, nil)
                        return
                    }
                }
            }
        }
        
        task.resume()
    }
}
