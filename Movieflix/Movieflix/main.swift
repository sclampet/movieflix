//
//  main.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/26/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

let sceneDelegateClass: AnyClass = NSClassFromString("TestingSceneDelegate") ?? SceneDelegate.self

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(sceneDelegateClass)
)
