//
//  AuthAssembly.swift
//  Coordinator
//

import Common
import Foundation
import Swinject

public final class AuthAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        registerAuthRepository(in: container)
        registerAuthInteractors(in: container)
        registerAuthViewControllerFactories(in: container)
        registerAuthCoordinatorFactory(in: container)
    }

    private func registerAuthRepository(in container: Container) {
        container.register(AuthRepositoryProtocol.self) { _ in
            AuthRepository()
        }.inObjectScope(.container)
    }

    private func registerAuthInteractors(in container: Container) {
        container.register(LoginInteractorProtocol.self) { resolver in
            LoginInteractor(authRepository: resolver.resolve(AuthRepositoryProtocol.self)!)
        }
        container.register(RegistrationInteractorProtocol.self) { resolver in
            RegistrationInteractor(authRepository: resolver.resolve(AuthRepositoryProtocol.self)!)
        }
        container.register(ForgotPasswordInteractorProtocol.self) { resolver in
            ForgotPasswordInteractor(authRepository: resolver.resolve(AuthRepositoryProtocol.self)!)
        }
    }

    private func registerAuthViewControllerFactories(in container: Container) {
        container.register(LoginViewControllerFactoryProtocol.self, factory: LoginViewControllerFactory.init)
        container.register(RegistrationViewControllerFactoryProtocol.self, factory: RegistrationViewControllerFactory.init)
        container.register(ForgotPasswordViewControllerFactoryProtocol.self, factory: ForgotPasswordViewControllerFactory.init)
    }

    private func registerAuthCoordinatorFactory(in container: Container) {
        container.register(AuthCoordinatorFactoryProtocol.self, factory: AuthCoordinatorFactory.init)
    }
}
