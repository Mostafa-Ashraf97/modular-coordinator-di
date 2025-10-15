//
//  SplashAssembly.swift
//  MyCoordinatorPattern
//
//  Splash Screen Dependencies
//

import Foundation
import Factory

extension Container {
    
    // MARK: - Splash Interactor
    var splashInteractor: Factory<SplashInteractorProtocol> {
        self { SplashInteractor() }
    }
    
    // MARK: - Splash ViewController Factory
    var splashViewControllerFactory: Factory<SplashViewControllerFactoryProtocol> {
        self { SplashViewControllerFactory(container: self) }
    }
}
