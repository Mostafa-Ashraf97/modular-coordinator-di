//
//  SceneDelegate.swift
//  CleanCoordinatorApp
//

import UIKit
import Factory

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let appWindow = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        
        let router = NavigationRouter(navigationController: navigationController)
        let appCoordinatorFactory = Container.shared.appCoordinatorFactory()
        let coordinator = appCoordinatorFactory.makeAppCoordinator(router: router)
        self.coordinator = coordinator
        
        coordinator.start()
        
        appWindow.rootViewController = navigationController
        appWindow.makeKeyAndVisible()
        
        window = appWindow
    }

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}

