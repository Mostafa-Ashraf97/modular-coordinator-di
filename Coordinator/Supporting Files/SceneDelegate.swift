//
//  SceneDelegate.swift
//  Coordinator
//

import Authentication
import Common
import Home
import Profile
import Settings
import Swinject
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var coordinator: AppCoordinatorProtocol?
    var assembler: Assembler?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        setupDependencies()
        setupAppCoordinator(with: windowScene)
    }

    private func setupDependencies() {
        let featureModules: [Assembly] = [
            ProfileAssembly(),
            AuthAssembly(),
            SettingsAssembly(),
            HomeAssembly()
        ]

        let appModules: [Assembly] = [
            AppCoordinatorAssembly(),
            SplashAssembly()
        ]

        assembler = Assembler()
        assembler?.apply(assemblies: featureModules + appModules)
    }

    private func setupAppCoordinator(with windowScene: UIWindowScene) {
        let appCoordinatorFactory = assembler?.resolver.resolve(AppCoordinatorFactoryProtocol.self)!
        coordinator = appCoordinatorFactory?.makeAppCoordinator()
        coordinator?.configure(with: windowScene)
        coordinator?.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
