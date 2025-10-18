//
//  AuthCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol AuthCoordinatorFactoryProtocol {
    func makeAuthCoordinator(router: Router) -> AuthFlowCoordinatorProtocol
}

final class AuthCoordinatorFactory: AuthCoordinatorFactoryProtocol {
    
    private let loginFactory: LoginViewControllerFactoryProtocol
    private let forgotPasswordFactory: ForgotPasswordViewControllerFactoryProtocol
    private let registrationFactory: RegistrationViewControllerFactoryProtocol
    
    init(
        loginFactory: LoginViewControllerFactoryProtocol,
        forgotPasswordFactory: ForgotPasswordViewControllerFactoryProtocol,
        registrationFactory: RegistrationViewControllerFactoryProtocol
    ) {
        self.loginFactory = loginFactory
        self.forgotPasswordFactory = forgotPasswordFactory
        self.registrationFactory = registrationFactory
    }
    
    func makeAuthCoordinator(router: Router) -> AuthFlowCoordinatorProtocol {
        return AuthCoordinator(
            router: router,
            loginFactory: loginFactory,
            forgotPasswordFactory: forgotPasswordFactory,
            registrationFactory: registrationFactory
        )
    }
}
