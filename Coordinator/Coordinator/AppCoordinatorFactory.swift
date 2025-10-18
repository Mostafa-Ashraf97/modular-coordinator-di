//
//  AppCoordinatorFactory.swift
//  Coordinator
//

import Authentication
import Common
import Home
import Swinject
import UIKit

protocol AppCoordinatorFactoryProtocol {
    func makeAppCoordinator() -> AppCoordinatorProtocol
}

struct AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    let resolver: Resolver

    func makeAppCoordinator() -> AppCoordinatorProtocol {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        let router = NavigationRouter(navigationController: navigationController)

        let splashFactory = resolver.resolve(SplashViewControllerFactoryProtocol.self)!
        let authCoordinatorFactory = resolver.resolve(AuthCoordinatorFactoryProtocol.self)!
        let homeCoordinatorFactory = resolver.resolve(HomeCoordinatorFactoryProtocol.self)!

        return AppCoordinator(
            router: router,
            splashFactory: splashFactory,
            authCoordinatorFactory: authCoordinatorFactory,
            homeCoordinatorFactory: homeCoordinatorFactory
        )
    }
}
