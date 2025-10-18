//
//  HomeAssembly.swift
//  Coordinator
//

import Common
import Swinject

public final class HomeAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        registerHomeInteractor(in: container)
        registerHomeViewControllerFactory(in: container)
        registerHomeCoordinatorFactory(in: container)
    }

    private func registerHomeInteractor(in container: Container) {
        container.register(HomeInteractorProtocol.self) { _ in
            HomeInteractor()
        }
    }

    private func registerHomeViewControllerFactory(in container: Container) {
        container.register(HomeViewControllerFactoryProtocol.self, factory: HomeViewControllerFactory.init)
    }

    private func registerHomeCoordinatorFactory(in container: Container) {
        container.register(HomeCoordinatorFactoryProtocol.self, factory: HomeCoordinatorFactory.init)
    }
}
