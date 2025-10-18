//
//  SettingsCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol SettingsCoordinatorFactoryProtocol {
    func makeSettingsCoordinator(router: Router) -> SettingsFlowCoordinatorProtocol
}

final class SettingsCoordinatorFactory: SettingsCoordinatorFactoryProtocol {
    
    private let settingsFactory: SettingsViewControllerFactoryProtocol
    private let notificationSettingsFactory: NotificationSettingsViewControllerFactoryProtocol
    
    init(
        settingsFactory: SettingsViewControllerFactoryProtocol,
        notificationSettingsFactory: NotificationSettingsViewControllerFactoryProtocol
    ) {
        self.settingsFactory = settingsFactory
        self.notificationSettingsFactory = notificationSettingsFactory
    }
    
    func makeSettingsCoordinator(router: Router) -> SettingsFlowCoordinatorProtocol {
        return SettingsCoordinator(
            router: router,
            settingsFactory: settingsFactory,
            notificationSettingsFactory: notificationSettingsFactory
        )
    }
}

