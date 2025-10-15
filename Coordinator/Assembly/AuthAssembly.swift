//
//  AuthAssembly.swift
//  MyCoordinatorPattern
//
//  Authentication Flow Dependencies
//

import Foundation
import Factory

extension Container {
    
    // MARK: - Auth Repository
    var authRepository: Factory<AuthRepositoryProtocol> {
        self { AuthRepository() }
            .singleton
    }
    
    // MARK: - Auth Interactors
    var loginInteractor: Factory<LoginInteractorProtocol> {
        self { LoginInteractor(authRepository: self.authRepository()) }
    }
    
    var registrationInteractor: Factory<RegistrationInteractorProtocol> {
        self { RegistrationInteractor(authRepository: self.authRepository()) }
    }
    
    var forgotPasswordInteractor: Factory<ForgotPasswordInteractorProtocol> {
        self { ForgotPasswordInteractor(authRepository: self.authRepository()) }
    }
    
    // MARK: - Auth ViewController Factories
    var loginViewControllerFactory: Factory<LoginViewControllerFactoryProtocol> {
        self { LoginViewControllerFactory(container: self) }
    }
    
    var registrationViewControllerFactory: Factory<RegistrationViewControllerFactoryProtocol> {
        self { RegistrationViewControllerFactory() }
    }
    
    var forgotPasswordViewControllerFactory: Factory<ForgotPasswordViewControllerFactoryProtocol> {
        self { ForgotPasswordViewControllerFactory(container: self) }
    }
    
    // MARK: - Auth Coordinator Factory
    var authCoordinatorFactory: Factory<AuthCoordinatorFactoryProtocol> {
        self {
            AuthCoordinatorFactory(
                loginFactory: self.loginViewControllerFactory(),
                forgotPasswordFactory: self.forgotPasswordViewControllerFactory(),
                registrationFactory: self.registrationViewControllerFactory()
            )
        }
    }
}
