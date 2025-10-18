//
//  SettingsCoordinatorFactory.swift
//  Coordinator
//

import Common
import Swinject
import UIKit

struct SettingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol {
    let resolver: Resolver

    func makeSettingsCoordinator(router: Router) -> SettingsFlowCoordinatorProtocol {
        let settingsFactory = resolver.resolve(SettingsViewControllerFactoryProtocol.self)!
        let notificationSettingsFactory = resolver.resolve(NotificationSettingsViewControllerFactoryProtocol.self)!

        return SettingsCoordinator(
            router: router,
            settingsFactory: settingsFactory,
            notificationSettingsFactory: notificationSettingsFactory
        )
    }
}
