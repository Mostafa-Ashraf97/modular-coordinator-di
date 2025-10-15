//
//  AppCoordinatorAssembly.swift
//  MyCoordinatorPattern
//
//  Root Coordinator Dependencies
//

import Foundation
import Factory

extension Container {
    
    // MARK: - Root Coordinator Factory
    var appCoordinatorFactory: Factory<AppCoordinatorFactoryProtocol> {
        self {
            AppCoordinatorFactory(
                splashFactory: self.splashViewControllerFactory(),
                authFactory: self.authCoordinatorFactory(),
                homepageFactory: self.homepageCoordinatorFactory()
            )
        }
    }
}

