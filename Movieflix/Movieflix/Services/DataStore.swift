//
//  DataStore.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/23/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import Foundation

protocol DataStore {
    associatedtype T where T: Codable
    
    func elements() -> [T]
    func element(id: String) -> T?
}

protocol Idable {
    var id: String { get }
}

class DataStoreImplementation<Element>: DataStore where Element: Codable & Idable {
    typealias T = Element
    private var dataInMemory: [T] = []
    
    init() {
        // use httpclient to access movie api
    }
    
    func elements() -> [Element] {
        return dataInMemory
    }
    
    func element(id: String) -> Element? {
        return dataInMemory.first(where: { $0.id == id })
    }
    
}
