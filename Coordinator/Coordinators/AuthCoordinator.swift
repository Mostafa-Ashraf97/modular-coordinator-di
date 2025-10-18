//
//  AuthCoordinator.swift
//  MyCoordinatorPattern
//

import Foundation
import UIKit

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
        router.pushWithCustomTransition(loginVC, transition: .fromRight)
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
        router.pushWithCustomTransition(forgotPasswordVC, transition: .fromLeft)
    }

    func navigateToRegister() {
        let registerVC = registrationFactory.makeRegistrationViewController(coordinator: self)
        router.pushWithCustomTransition(registerVC, transition: .fromLeft)
    }
}

// MARK: - ForgotPasswordCoordinatorActions
extension AuthCoordinator: ForgotPasswordCoordinatorActions {
    func forgotPasswordFinished() {
        let loginVC = loginFactory.makeLoginViewController(coordinator: self)
        router.pushWithCustomTransition(loginVC, transition: .fromRight)
    }
}

// MARK: - RegistrationIntroCoordinatorActions
extension AuthCoordinator: RegistrationIntroCoordinatorActions {
    func registerIntroFinished(newUser: User) {
        onAuthenticationSuccess?(newUser)
        finish()
    }
}
