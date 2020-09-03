//
//  AppDelegate.swift
//  Weather
//
//  Created by Daniel Sumara on 03/09/2020.
//  Copyright © 2020 Daniel Sumara. All rights reserved.
//

import UIKit

@UIApplicationMain
private class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - API

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

}
