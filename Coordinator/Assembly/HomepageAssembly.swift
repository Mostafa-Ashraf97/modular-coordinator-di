//
//  HomepageAssembly.swift
//  MyCoordinatorPattern
//
//  Homepage Flow Dependencies
//

import Foundation
import Factory

extension Container {
    
    // MARK: - Homepage Interactor
    var homepageInteractor: Factory<HomepageInteractorProtocol> {
        self { HomepageInteractor() }
    }
    
    // MARK: - Homepage ViewController Factory
    var homepageViewControllerFactory: Factory<HomepageViewControllerFactoryProtocol> {
        self { HomepageViewControllerFactory(container: self) }
    }
    
    // MARK: - Homepage Coordinator Factory
    var homepageCoordinatorFactory: Factory<HomepageCoordinatorFactoryProtocol> {
        self {
            HomepageCoordinatorFactory(
                homepageFactory: self.homepageViewControllerFactory(),
                profileCoordinatorFactory: self.profileCoordinatorFactory(),
                settingsCoordinatorFactory: self.settingsCoordinatorFactory()
            )
        }
    }
}
