//
//  ProfileCoordinator.swift
//  MyCoordinatorPattern
//

import Foundation
import UIKit

final class ProfileCoordinator: ProfileFlowCoordinatorProtocol {
    
    // MARK: - ChildCoordinator
    weak var finishDelegate: CoordinatorFinishDelegate?
    private(set) weak var rootViewController: UIViewController?
    
    // MARK: - Coordinator
    var navigationController: UINavigationController
    
    // MARK: - Dependencies
    private let profileFactory: ProfileViewControllerFactoryProtocol
    private let profileDetailsFactory: ProfileDetailsViewControllerFactoryProtocol
    
    init(
        navigationController: UINavigationController,
        profileFactory: ProfileViewControllerFactoryProtocol,
        profileDetailsFactory: ProfileDetailsViewControllerFactoryProtocol
    ) {
        self.navigationController = navigationController
        self.profileFactory = profileFactory
        self.profileDetailsFactory = profileDetailsFactory
    }
    
    func start() {
        let profileVC = profileFactory.makeProfileViewController(coordinator: self)
        rootViewController = profileVC
        navigationController.pushViewController(profileVC, animated: true)
    }
}

// MARK: - ProfileCoordinatorActions
extension ProfileCoordinator: ProfileCoordinatorActions {
    
    func navigateToProfileDetails() {
        let detailsVC = profileDetailsFactory.makeProfileDetailsViewController(coordinator: self)
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
