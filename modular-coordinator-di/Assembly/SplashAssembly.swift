//
//  SplashAssembly.swift
//  Coordinator
//

import Foundation
import Swinject

final class SplashAssembly: Assembly {
    init() {}

    func assemble(container: Container) {
        registerSplash(in: container)
    }

    private func registerSplash(in container: Container) {
        container.register(SplashViewControllerFactoryProtocol.self, factory: SplashViewControllerFactory.init)

        container.register(SplashInteractorProtocol.self) { _ in
            SplashInteractor()
        }
    }
}
