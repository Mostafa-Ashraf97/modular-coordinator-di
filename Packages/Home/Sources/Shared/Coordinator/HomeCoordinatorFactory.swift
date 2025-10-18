//
//  HomeCoordinatorFactory.swift
//  Coordinator
//

import Common
import Swinject
import UIKit

struct HomeCoordinatorFactory: HomeCoordinatorFactoryProtocol {
    let resolver: Resolver

    func makeHomeCoordinator(router: Router) -> HomeFlowCoordinatorProtocol {
        let homeFactory = resolver.resolve(HomeViewControllerFactoryProtocol.self)!
        let profileCoordinatorFactory = resolver.resolve(ProfileCoordinatorFactoryProtocol.self)!
        let settingsCoordinatorFactory = resolver.resolve(SettingsCoordinatorFactoryProtocol.self)!

        return HomeCoordinator(
            router: router,
            homeFactory: homeFactory,
            profileCoordinatorFactory: profileCoordinatorFactory,
            settingsCoordinatorFactory: settingsCoordinatorFactory
        )
    }
}
