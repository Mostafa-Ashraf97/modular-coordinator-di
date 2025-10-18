//
//  ProfileAssembly.swift
//  Coordinator
//

import Common
import Foundation
import Swinject

public final class ProfileAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        registerProfileInteractor(in: container)
        registerProfileViewControllerFactories(in: container)
        registerProfileCoordinatorFactory(in: container)
    }

    private func registerProfileInteractor(in container: Container) {
        container.register(ProfileInteractorProtocol.self) { _ in
            ProfileInteractor()
        }
    }

    private func registerProfileViewControllerFactories(in container: Container) {
        container.register(ProfileViewControllerFactoryProtocol.self, factory: ProfileViewControllerFactory.init)
        container.register(ProfileDetailsViewControllerFactoryProtocol.self, factory: ProfileDetailsViewControllerFactory.init)
    }

    private func registerProfileCoordinatorFactory(in container: Container) {
        container.register(ProfileCoordinatorFactoryProtocol.self, factory: ProfileCoordinatorFactory.init)
    }
}
