//
//  DataStore.swift
//  Movieflix
//
//  Created by Scott Clampet on 5/9/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

protocol DataStore {
    associatedtype T where T: Codable
    
    func elements() -> [String: [T]]?
    func updateElements(elements: [String: [T]])
}

protocol Idable {
    var id: String { get }
}

class DataStoreImplementation<Element>: DataStore where Element: Codable & Idable {
    typealias T = Element
    var dataInMemory: [String: [T]]?
    
    func elements() -> [String: [T]]? {
        guard let dataInMemory = dataInMemory else { return nil}
        return dataInMemory
    }
    
    func updateElements(elements: [String : [Element]]) {
        dataInMemory = elements
    }
}
