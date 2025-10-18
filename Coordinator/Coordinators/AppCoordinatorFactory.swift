//
//  AppCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol AppCoordinatorFactoryProtocol {
    func makeAppCoordinator() -> AppCoordinatorProtocol

}

final class AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    
    private let splashFactory: SplashViewControllerFactoryProtocol
    private let authFactory: AuthCoordinatorFactoryProtocol
    private let homepageFactory: HomepageCoordinatorFactoryProtocol
    
    init(
        splashFactory: SplashViewControllerFactoryProtocol,
        authFactory: AuthCoordinatorFactoryProtocol,
        homepageFactory: HomepageCoordinatorFactoryProtocol
    ) {
        self.splashFactory = splashFactory
        self.authFactory = authFactory
        self.homepageFactory = homepageFactory
    }
    
    func makeAppCoordinator() -> AppCoordinatorProtocol {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        let router = NavigationRouter(navigationController: navigationController)

        return AppCoordinator(
            router: router,
            splashFactory: splashFactory,
            authCoordinatorFactory: authFactory,
            homepageCoordinatorFactory: homepageFactory
        )
    }
}
