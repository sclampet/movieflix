//
//  TestingRootViewController.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/26/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class TestingRootViewController: UIViewController {

    override func loadView() {
        let label = UILabel()
        label.text = "Running Unit Tests..."
        label.textAlignment = .center
        label.textColor = .white

        view = label
    }
}
