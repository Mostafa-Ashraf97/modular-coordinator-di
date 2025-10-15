//
//  HomepageCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol HomepageCoordinatorFactoryProtocol {
    func makeHomepageCoordinator(navigationController: UINavigationController) -> HomeFlowCoordinatorProtocol
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
    
    func makeHomepageCoordinator(navigationController: UINavigationController) -> HomeFlowCoordinatorProtocol {
        return HomepageCoordinator(
            navigationController: navigationController,
            homepageFactory: homepageFactory,
            profileCoordinatorFactory: profileCoordinatorFactory,
            settingsCoordinatorFactory: settingsCoordinatorFactory
        )
    }
}
