//
//  ProfileCoordinatorFactory.swift
//  Coordinator
//

import Common
import Swinject
import UIKit

struct ProfileCoordinatorFactory: ProfileCoordinatorFactoryProtocol {
    let resolver: Resolver

    func makeProfileCoordinator(router: Router) -> ProfileFlowCoordinatorProtocol {
        let profileFactory = resolver.resolve(ProfileViewControllerFactoryProtocol.self)!
        let profileDetailsFactory = resolver.resolve(ProfileDetailsViewControllerFactoryProtocol.self)!

        return ProfileCoordinator(
            router: router,
            profileFactory: profileFactory,
            profileDetailsFactory: profileDetailsFactory
        )
    }
}
