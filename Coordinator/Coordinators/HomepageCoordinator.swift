//
//  HomepageCoordinator.swift
//  MyCoordinatorPattern
//

import Foundation
import UIKit

final class HomepageCoordinator: HomeFlowCoordinatorProtocol {
    // MARK: - ChildCoordinator
    weak var finishDelegate: CoordinatorFinishDelegate?
    private(set) weak var rootViewController: UIViewController?

    // MARK: - ParentCoordinator
    var childCoordinators = [ChildCoordinator]()

    // MARK: - Coordinator
    let router: Router

    // MARK: - Dependencies
    private let homepageFactory: HomepageViewControllerFactoryProtocol
    private let profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol
    private let settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol

    init(
        router: Router,
        homepageFactory: HomepageViewControllerFactoryProtocol,
        profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol,
        settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol
    ) {
        self.router = router
        self.homepageFactory = homepageFactory
        self.profileCoordinatorFactory = profileCoordinatorFactory
        self.settingsCoordinatorFactory = settingsCoordinatorFactory
    }

    func start() {
        router.delegate = self
        let homepageVC = homepageFactory.makeHomepageViewController(coordinator: self)
        rootViewController = homepageVC
        router.push(homepageVC, animated: false)
    }
}

// MARK: - HomepageCoordinatorActions
extension HomepageCoordinator: HomepageCoordinatorActions {
    func navigateToProfile() {
        let profileCoordinator = profileCoordinatorFactory.makeProfileCoordinator(router: router)
        profileCoordinator.finishDelegate = self
        addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
    }

    func navigateToSettings() {
        let settingsCoordinator = settingsCoordinatorFactory.makeSettingsCoordinator(router: router)
        settingsCoordinator.finishDelegate = self
        addChildCoordinator(settingsCoordinator)
        settingsCoordinator.start()
    }
}

