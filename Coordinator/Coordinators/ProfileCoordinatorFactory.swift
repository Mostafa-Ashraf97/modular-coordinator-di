//
//  ProfileCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol ProfileCoordinatorFactoryProtocol {
    func makeProfileCoordinator(navigationController: UINavigationController) -> ProfileFlowCoordinatorProtocol
}

final class ProfileCoordinatorFactory: ProfileCoordinatorFactoryProtocol {
    
    private let profileFactory: ProfileViewControllerFactoryProtocol
    private let profileDetailsFactory: ProfileDetailsViewControllerFactoryProtocol
    
    init(
        profileFactory: ProfileViewControllerFactoryProtocol,
        profileDetailsFactory: ProfileDetailsViewControllerFactoryProtocol
    ) {
        self.profileFactory = profileFactory
        self.profileDetailsFactory = profileDetailsFactory
    }
    
    func makeProfileCoordinator(navigationController: UINavigationController) -> ProfileFlowCoordinatorProtocol {
        return ProfileCoordinator(
            navigationController: navigationController,
            profileFactory: profileFactory,
            profileDetailsFactory: profileDetailsFactory
        )
    }
}

