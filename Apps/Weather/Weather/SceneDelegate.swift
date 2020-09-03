//
//  SceneDelegate.swift
//  Weather
//
//  Created by Daniel Sumara on 03/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties

    private var mainWindow: UIWindow?

    // MARK: - API

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        window.makeKeyAndVisible()

        mainWindow = window
    }

}
