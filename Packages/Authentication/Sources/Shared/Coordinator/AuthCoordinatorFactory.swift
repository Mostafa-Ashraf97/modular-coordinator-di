//
//  AuthCoordinatorFactory.swift
//  Coordinator
//

import Common
import Swinject
import UIKit

struct AuthCoordinatorFactory: AuthCoordinatorFactoryProtocol {
    let resolver: Resolver

    func makeAuthCoordinator(router: Router) -> AuthFlowCoordinatorProtocol {
        let loginFactory = resolver.resolve(LoginViewControllerFactoryProtocol.self)!
        let forgotPasswordFactory = resolver.resolve(ForgotPasswordViewControllerFactoryProtocol.self)!
        let registrationFactory = resolver.resolve(RegistrationViewControllerFactoryProtocol.self)!

        return AuthCoordinator(
            router: router,
            loginFactory: loginFactory,
            forgotPasswordFactory: forgotPasswordFactory,
            registrationFactory: registrationFactory
        )
    }
}
