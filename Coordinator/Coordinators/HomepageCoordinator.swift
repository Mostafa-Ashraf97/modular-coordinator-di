//
//  HomepageCoordinator.swift
//  MyCoordinatorPattern
//

import Foundation
import UIKit

final class HomepageCoordinator: NSObject, HomeFlowCoordinatorProtocol {
    // MARK: - ChildCoordinator
    weak var finishDelegate: CoordinatorFinishDelegate?
    private(set) weak var rootViewController: UIViewController?

    // MARK: - ParentCoordinator
    var childCoordinators = [ChildCoordinator]()

    // MARK: - Coordinator
    var navigationController: UINavigationController

    // MARK: - Dependencies
    private let homepageFactory: HomepageViewControllerFactoryProtocol
    private let profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol
    private let settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol

    init(
        navigationController: UINavigationController,
        homepageFactory: HomepageViewControllerFactoryProtocol,
        profileCoordinatorFactory: ProfileCoordinatorFactoryProtocol,
        settingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol
    ) {
        self.navigationController = navigationController
        self.homepageFactory = homepageFactory
        self.profileCoordinatorFactory = profileCoordinatorFactory
        self.settingsCoordinatorFactory = settingsCoordinatorFactory
        super.init()
    }

    func start() {
        navigationController.delegate = self
        let homepageVC = homepageFactory.makeHomepageViewController(coordinator: self)
        rootViewController = homepageVC
        navigationController.pushViewController(homepageVC, animated: false)
    }
    
    deinit {
        if navigationController.delegate === self {
            navigationController.delegate = nil
        }
    }
}

// MARK: - HomepageCoordinatorActions
extension HomepageCoordinator: HomepageCoordinatorActions {
    func navigateToProfile() {
        let profileCoordinator = profileCoordinatorFactory.makeProfileCoordinator(
            navigationController: navigationController
        )
        profileCoordinator.finishDelegate = self
        addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
    }

    func navigateToSettings() {
        let settingsCoordinator = settingsCoordinatorFactory.makeSettingsCoordinator(
            navigationController: navigationController
        )
        settingsCoordinator.finishDelegate = self
        addChildCoordinator(settingsCoordinator)
        settingsCoordinator.start()
    }
}

// MARK: - UINavigationControllerDelegate
extension HomepageCoordinator: UINavigationControllerDelegate {}
