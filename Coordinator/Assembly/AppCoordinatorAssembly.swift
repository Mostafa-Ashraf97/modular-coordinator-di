//
//  AppCoordinatorAssembly.swift
//  Coordinator
//
//  Root Coordinator Dependencies
//

import Swinject

final class AppCoordinatorAssembly: Assembly {
    init() {}

    func assemble(container: Container) {
        registerAppCoordinatorFactory(in: container)
    }

    private func registerAppCoordinatorFactory(in container: Container) {
        container.register(AppCoordinatorFactoryProtocol.self, factory: AppCoordinatorFactory.init)
    }
}
