//
//  SceneDelegate.swift
//  songflow
//
//  Created by Burak Özdemir on 28.02.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = SplashViewController()
        window.makeKeyAndVisible()
        
        let authNavController = UINavigationController(rootViewController: LoginViewController())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve) {
                window.rootViewController = authNavController
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
}
