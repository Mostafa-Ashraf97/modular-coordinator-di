//
//  AuthCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol AuthCoordinatorFactoryProtocol {
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthFlowCoordinatorProtocol
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
    
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthFlowCoordinatorProtocol {
        return AuthCoordinator(
            navigationController: navigationController,
            loginFactory: loginFactory,
            forgotPasswordFactory: forgotPasswordFactory,
            registrationFactory: registrationFactory
        )
    }
}
