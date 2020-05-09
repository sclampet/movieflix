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
        
        //httpClient
        let httpClient = MoviesClient(session: URLSession(configuration: .default))
        let moviesHttpService = MoviesHttpService(httpClient: httpClient)
        //dataStore
        let dataStore = DataStoreImplementation<Movie>()
        let moviesDataStoreService = MoviesDataStoreService(dataStore: dataStore)
        
        let navigationController = UINavigationController()
        
        mainCoordinator = MainCoordinator(navigationController: navigationController,
                                          moviesHttpService: moviesHttpService,
                                          moviesDataStoreService: moviesDataStoreService)
        
        mainCoordinator?.start()
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
}

