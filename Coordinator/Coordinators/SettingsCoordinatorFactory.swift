//
//  SettingsCoordinatorFactory.swift
//  MyCoordinatorPattern
//

import UIKit

protocol SettingsCoordinatorFactoryProtocol {
    func makeSettingsCoordinator(navigationController: UINavigationController) -> SettingsFlowCoordinatorProtocol
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
    
    func makeSettingsCoordinator(navigationController: UINavigationController) -> SettingsFlowCoordinatorProtocol {
        return SettingsCoordinator(
            navigationController: navigationController,
            settingsFactory: settingsFactory,
            notificationSettingsFactory: notificationSettingsFactory
        )
    }
}

