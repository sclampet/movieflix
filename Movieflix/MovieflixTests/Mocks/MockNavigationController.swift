//
//  MockNavigationController.swift
//  MovieflixTests
//
//  Created by Scott Clampet on 4/25/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class MockNavigationController: UINavigationController {
    var lastPushedVC: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        lastPushedVC = viewController
    }
}
