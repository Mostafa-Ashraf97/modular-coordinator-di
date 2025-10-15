//
//  AppCoordinator.swift
//  MyCoordinatorPattern
//

import Foundation
import UIKit

final class AppCoordinator: NSObject, AppCoordinatorProtocol {
    
    // MARK: - ParentCoordinator
    var childCoordinators = [ChildCoordinator]()
    
    // MARK: - Coordinator
    var navigationController: UINavigationController
    
    // MARK: - Dependencies
    private let splashFactory: SplashViewControllerFactoryProtocol
    private let authCoordinatorFactory: AuthCoordinatorFactoryProtocol
    private let homepageCoordinatorFactory: HomepageCoordinatorFactoryProtocol
    
    init(
        navigationController: UINavigationController,
        splashFactory: SplashViewControllerFactoryProtocol,
        authCoordinatorFactory: AuthCoordinatorFactoryProtocol,
        homepageCoordinatorFactory: HomepageCoordinatorFactoryProtocol
    ) {
        self.navigationController = navigationController
        self.splashFactory = splashFactory
        self.authCoordinatorFactory = authCoordinatorFactory
        self.homepageCoordinatorFactory = homepageCoordinatorFactory
        super.init()
    }
    
    func start() {
        navigationController.delegate = self
        let splashVC = splashFactory.makeSplashViewController(coordinator: self)
        navigationController.pushViewController(splashVC, animated: true)
    }
}

// MARK: - SplashCoordinatorActions
extension AppCoordinator: SplashCoordinatorActions {
    
    func navigateFromSplash(isLoggedIn: Bool, user: User?) {
        if let user, isLoggedIn {
            navigateToHome(userData: user)
        } else {
            navigateToAuthentication()
        }
    }
    
    private func navigateToHome(userData: User) {
        let homepageCoordinator = homepageCoordinatorFactory.makeHomepageCoordinator(
            navigationController: navigationController
        )
        homepageCoordinator.finishDelegate = self
        addChildCoordinator(homepageCoordinator)
        homepageCoordinator.start()
    }
    
    private func navigateToAuthentication() {
        let authCoordinator = authCoordinatorFactory.makeAuthCoordinator(
            navigationController: navigationController
        )
        authCoordinator.finishDelegate = self
        authCoordinator.onAuthenticationSuccess = { [weak self] user in
            self?.navigateToHome(userData: user)
        }
        addChildCoordinator(authCoordinator)
        authCoordinator.start()
    }
}

// MARK: - UINavigationControllerDelegate
extension AppCoordinator: UINavigationControllerDelegate {}
