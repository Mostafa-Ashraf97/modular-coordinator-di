//
//  SettingsAssembly.swift
//  Coordinator
//

import Common
import Foundation
import Swinject

public final class SettingsAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        registerSettingsInteractor(in: container)
        registerSettingsViewControllerFactories(in: container)
        registerSettingsCoordinatorFactory(in: container)
    }

    private func registerSettingsInteractor(in container: Container) {
        container.register(SettingsInteractorProtocol.self) { _ in
            SettingsInteractor()
        }
    }

    private func registerSettingsViewControllerFactories(in container: Container) {
        container.register(
            SettingsViewControllerFactoryProtocol.self,
            factory: SettingsViewControllerFactory.init
        )

        container.register(
            NotificationSettingsViewControllerFactoryProtocol.self,
            factory: NotificationSettingsViewControllerFactory.init
        )
    }

    private func registerSettingsCoordinatorFactory(in container: Container) {
        container.register(
            SettingsCoordinatorFactoryProtocol.self,
            factory: SettingsCoordinatorFactory.init
        )
    }
}
