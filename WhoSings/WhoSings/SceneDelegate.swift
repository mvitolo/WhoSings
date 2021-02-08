//
//  SceneDelegate.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import UIKit
import UIKitPlus

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = NavigationController(MainViewController())
            .tint(.darkGray)
        window.makeKeyAndVisible()
        self.window = window
    }
}

