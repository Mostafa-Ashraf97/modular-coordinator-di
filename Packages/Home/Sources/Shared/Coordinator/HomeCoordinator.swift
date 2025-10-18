//
//  HomeCoordinator.swift
//  Coordinator
//

import Common
import Foundation
import UIKit

final class HomeCoordinator: HomeFlowCoordinatorProtocol {
    // MARK: - ChildCoordinator
    weak var finishDelegate: CoordinatorFinishDelegate?
    private(set) weak var rootViewController: UIViewController?

    // MARK: - ParentCoordinator
    var childCoordinators = [ChildCoordinator]()

    // MARK: - Coordinator
    let router: Router

    // MARK: - Dependencies
    private let homeFactory: HomeViewControllerFactoryProtocol
    private let profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol
    private let settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol

    init(
        router: Router,
        homeFactory: HomeViewControllerFactoryProtocol,
        profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol,
        settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol
    ) {
        self.router = router
        self.homeFactory = homeFactory
        self.profileCoordinatorFactory = profileCoordinatorFactory
        self.settingsCoordinatorFactory = settingsCoordinatorFactory
    }

    func start() {
        router.delegate = self
        let homeVC = homeFactory.makeHomeViewController(coordinator: self)
        rootViewController = homeVC
        router.push(homeVC, animated: false)
    }
}

// MARK: - HomeCoordinatorActions
extension HomeCoordinator: HomeCoordinatorActions {
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
