//
//  SceneDelegate.swift
//  Movieflix
//
//  Created by Scott Clampet on 4/23/20.
//  Copyright © 2020 Scott Clampet. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController()
        let httpClient = MoviesClient(session: URLSession(configuration: .default))
        let moviesHttpService = MoviesHttpService(httpClient: httpClient)
        
        mainCoordinator = MainCoordinator(navigationController: navigationController,
                                          moviesHttpService: moviesHttpService)
        
        mainCoordinator?.start()
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
}

