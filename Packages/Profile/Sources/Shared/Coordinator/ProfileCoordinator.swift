//
//  ProfileCoordinator.swift
//  Coordinator
//

import Common
import Foundation
import UIKit

final class ProfileCoordinator: ProfileFlowCoordinatorProtocol {
    // MARK: - ChildCoordinator
    weak var finishDelegate: CoordinatorFinishDelegate?
    private(set) weak var rootViewController: UIViewController?

    // MARK: - Coordinator
    let router: Router

    // MARK: - Dependencies
    private let profileFactory: ProfileViewControllerFactoryProtocol
    private let profileDetailsFactory: ProfileDetailsViewControllerFactoryProtocol

    init(
        router: Router,
        profileFactory: ProfileViewControllerFactoryProtocol,
        profileDetailsFactory: ProfileDetailsViewControllerFactoryProtocol
    ) {
        self.router = router
        self.profileFactory = profileFactory
        self.profileDetailsFactory = profileDetailsFactory
    }

    func start() {
        let profileVC = profileFactory.makeProfileViewController(coordinator: self)
        rootViewController = profileVC
        router.push(profileVC, animated: true)
    }
}

// MARK: - ProfileCoordinatorActions
extension ProfileCoordinator: ProfileCoordinatorActions {
    func navigateToProfileDetails() {
        let detailsVC = profileDetailsFactory.makeProfileDetailsViewController(coordinator: self)
        router.push(detailsVC, animated: true)
    }
}

extension ProfileCoordinator: ProfileDetailsCoordinatorActions {}
