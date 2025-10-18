//
//  ProfileCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol ProfileCoordinatorFactoryProtocol {
    func makeProfileCoordinator(router: Router) -> ProfileFlowCoordinatorProtocol
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
    
    func makeProfileCoordinator(router: Router) -> ProfileFlowCoordinatorProtocol {
        return ProfileCoordinator(
            router: router,
            profileFactory: profileFactory,
            profileDetailsFactory: profileDetailsFactory
        )
    }
}

