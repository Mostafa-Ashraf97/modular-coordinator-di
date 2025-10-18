//
//  HomepageCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol HomepageCoordinatorFactoryProtocol {
    func makeHomepageCoordinator(router: Router) -> HomeFlowCoordinatorProtocol
}

final class HomepageCoordinatorFactory: HomepageCoordinatorFactoryProtocol {
    
    private let homepageFactory: HomepageViewControllerFactoryProtocol
    private let profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol
    private let settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol
    
    init(
        homepageFactory: HomepageViewControllerFactoryProtocol,
        profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol,
        settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol
    ) {
        self.homepageFactory = homepageFactory
        self.profileCoordinatorFactory = profileCoordinatorFactory
        self.settingsCoordinatorFactory = settingsCoordinatorFactory
    }
    
    func makeHomepageCoordinator(router: Router) -> HomeFlowCoordinatorProtocol {
        return HomepageCoordinator(
            router: router,
            homepageFactory: homepageFactory,
            profileCoordinatorFactory: profileCoordinatorFactory,
            settingsCoordinatorFactory: settingsCoordinatorFactory
        )
    }
}
