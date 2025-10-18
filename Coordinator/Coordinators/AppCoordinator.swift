//
//  AppCoordinator.swift
//  MyCoordinatorPattern
//

import Foundation
import UIKit

final class AppCoordinator: AppCoordinatorProtocol {
    var window: UIWindow?
    
    // MARK: - ParentCoordinator
    var childCoordinators = [ChildCoordinator]()
    
    // MARK: - Coordinator
    let router: Router
    
    // MARK: - Dependencies
    private let splashFactory: SplashViewControllerFactoryProtocol
    private let authCoordinatorFactory: AuthCoordinatorFactoryProtocol
    private let homepageCoordinatorFactory: HomepageCoordinatorFactoryProtocol
    
    init(
        router: Router,
        splashFactory: SplashViewControllerFactoryProtocol,
        authCoordinatorFactory: AuthCoordinatorFactoryProtocol,
        homepageCoordinatorFactory: HomepageCoordinatorFactoryProtocol
    ) {
        self.router = router
        self.splashFactory = splashFactory
        self.authCoordinatorFactory = authCoordinatorFactory
        self.homepageCoordinatorFactory = homepageCoordinatorFactory
    }
    
    func configure(with windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = router.navigationController
        window?.makeKeyAndVisible()
    }
    
    func start() {
        router.delegate = self
        let splashVC = splashFactory.makeSplashViewController(coordinator: self)
        router.push(splashVC, animated: true)
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
        let homepageCoordinator = homepageCoordinatorFactory.makeHomepageCoordinator(router: router)
        homepageCoordinator.finishDelegate = self
        addChildCoordinator(homepageCoordinator)
        homepageCoordinator.start()
    }
    
    private func navigateToAuthentication() {
        let authCoordinator = authCoordinatorFactory.makeAuthCoordinator(router: router)
        authCoordinator.finishDelegate = self
        authCoordinator.onAuthenticationSuccess = { [weak self] user in
            self?.navigateToHome(userData: user)
        }
        addChildCoordinator(authCoordinator)
        authCoordinator.start()
    }
}

