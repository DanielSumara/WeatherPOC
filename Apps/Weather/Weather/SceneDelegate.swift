//
//  SceneDelegate.swift
//  Weather
//
//  Created by Daniel Sumara on 03/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import UIKit
import WeatherFlow

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties

    private let appCoordinator = AppCoordinator.instance

    // MARK: - API

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        
        appCoordinator.start(in: window)
    }

}
