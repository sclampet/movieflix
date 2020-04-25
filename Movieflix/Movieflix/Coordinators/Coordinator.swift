//
//  Coordinator.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/24/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
