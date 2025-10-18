//
//  AuthCoordinator.swift
//  Coordinator
//

import Foundation
import UIKit
import Common

final class AuthCoordinator: AuthFlowCoordinatorProtocol {
    // MARK: - ChildCoordinator
    weak var finishDelegate: CoordinatorFinishDelegate?
    private(set) weak var rootViewController: UIViewController?

    // MARK: - Coordinator
    let router: Router

    // MARK: - AuthFlowCoordinatorProtocol
    var onAuthenticationSuccess: ((User) -> ())?

    // MARK: - Dependencies
    private let loginFactory: LoginViewControllerFactoryProtocol
    private let forgotPasswordFactory: ForgotPasswordViewControllerFactoryProtocol
    private let registrationFactory: RegistrationViewControllerFactoryProtocol

    init(
        router: Router,
        loginFactory: LoginViewControllerFactoryProtocol,
        forgotPasswordFactory: ForgotPasswordViewControllerFactoryProtocol,
        registrationFactory: RegistrationViewControllerFactoryProtocol
    ) {
        self.router = router
        self.loginFactory = loginFactory
        self.forgotPasswordFactory = forgotPasswordFactory
        self.registrationFactory = registrationFactory
    }

    func start() {
        let loginVC = loginFactory.makeLoginViewController(coordinator: self)
        rootViewController = loginVC
        router.push(loginVC, animated: true)
    }
}

// MARK: - LoginCoordinatorActions
extension AuthCoordinator: LoginCoordinatorActions {
    func loginSuccess(user: User) {
        onAuthenticationSuccess?(user)
        finish()
    }

    func navigateToForgotPassword() {
        let forgotPasswordVC = forgotPasswordFactory.makeForgotPasswordViewController(coordinator: self)
        router.push(forgotPasswordVC, animated: true)
    }

    func navigateToRegister() {
        let registerVC = registrationFactory.makeRegistrationViewController(coordinator: self)
        router.push(registerVC, animated: true)
    }
}

// MARK: - ForgotPasswordCoordinatorActions
extension AuthCoordinator: ForgotPasswordCoordinatorActions {
    func forgotPasswordFinished() {
        let loginVC = loginFactory.makeLoginViewController(coordinator: self)
        router.push(loginVC, animated: true)
    }
}

// MARK: - RegistrationIntroCoordinatorActions
extension AuthCoordinator: RegistrationCoordinatorActions {
    func registerFinished(newUser: User) {
        onAuthenticationSuccess?(newUser)
        finish()
    }
}
