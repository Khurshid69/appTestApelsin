//
//  SceneDelegate.swift
//  appTestApelsin
//
//  Created by user on 03/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        let homeVC = HomeViewController()
        let navController: UINavigationController = makeNavController(rootViewController: homeVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    private func makeNavController<T: UINavigationController>(
        rootViewController: UIViewController
    ) -> T {
        let navController = T(rootViewController: rootViewController)
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.shadowColor = nil
        navController.navigationBar.tintColor = .white
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.standardAppearance = navBarAppearance
        return navController
    }
}

