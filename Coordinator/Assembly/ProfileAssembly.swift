//
//  ProfileAssembly.swift
//  MyCoordinatorPattern
//
//  Profile Flow Dependencies
//

import Foundation
import Factory

extension Container {
    
    // MARK: - Profile Interactor
    var profileInteractor: Factory<ProfileInteractorProtocol> {
        self { ProfileInteractor() }
    }
    
    // MARK: - Profile ViewController Factories
    var profileViewControllerFactory: Factory<ProfileViewControllerFactoryProtocol> {
        self { ProfileViewControllerFactory(container: self) }
    }
    
    var profileDetailsViewControllerFactory: Factory<ProfileDetailsViewControllerFactoryProtocol> {
        self { ProfileDetailsViewControllerFactory() }
    }
    
    // MARK: - Profile Coordinator Factory
    var profileCoordinatorFactory: Factory<ProfileCoordinatorFactoryProtocol> {
        self {
            ProfileCoordinatorFactory(
                profileFactory: self.profileViewControllerFactory(),
                profileDetailsFactory: self.profileDetailsViewControllerFactory()
            )
        }
    }
}
