//
//  AppCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol AppCoordinatorFactoryProtocol {
    func makeAppCoordinator(router: Router) -> AppCoordinatorProtocol
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
    
    func makeAppCoordinator(router: Router) -> AppCoordinatorProtocol {
        return AppCoordinator(
            router: router,
            splashFactory: splashFactory,
            authCoordinatorFactory: authFactory,
            homepageCoordinatorFactory: homepageFactory
        )
    }
}
