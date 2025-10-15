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
    var navigationController: UINavigationController

    // MARK: - AuthFlowCoordinatorProtocol
    var onAuthenticationSuccess: ((User) -> ())?

    // MARK: - Dependencies
    private let loginFactory: LoginViewControllerFactoryProtocol
    private let forgotPasswordFactory: ForgotPasswordViewControllerFactoryProtocol
    private let registrationFactory: RegistrationViewControllerFactoryProtocol

    init(
        navigationController: UINavigationController,
        loginFactory: LoginViewControllerFactoryProtocol,
        forgotPasswordFactory: ForgotPasswordViewControllerFactoryProtocol,
        registrationFactory: RegistrationViewControllerFactoryProtocol
    ) {
        self.navigationController = navigationController
        self.loginFactory = loginFactory
        self.forgotPasswordFactory = forgotPasswordFactory
        self.registrationFactory = registrationFactory
    }

    func start() {
        let loginVC = loginFactory.makeLoginViewController(coordinator: self)
        rootViewController = loginVC
        navigationController.customPushViewController(viewController: loginVC)
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
        navigationController.customPushViewController(viewController: forgotPasswordVC, direction: .fromLeft)
    }

    func navigateToRegister() {
        let registerVC = registrationFactory.makeRegistrationViewController(coordinator: self)
        navigationController.customPushViewController(viewController: registerVC, direction: .fromLeft)
    }
}

// MARK: - ForgotPasswordCoordinatorActions
extension AuthCoordinator: ForgotPasswordCoordinatorActions {
    func forgotPasswordFinished() {
        let loginVC = loginFactory.makeLoginViewController(coordinator: self)
        navigationController.customPushViewController(viewController: loginVC, direction: .fromRight)
    }
}

// MARK: - RegistrationIntroCoordinatorActions
extension AuthCoordinator: RegistrationIntroCoordinatorActions {
    func registerIntroFinished(newUser: User) {
        onAuthenticationSuccess?(newUser)
        finish()
    }
}
