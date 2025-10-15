//
//  SettingsAssembly.swift
//  MyCoordinatorPattern
//
//  Settings Flow Dependencies
//

import Foundation
import Factory

extension Container {
    
    // MARK: - Settings Interactor
    var settingsInteractor: Factory<SettingsInteractorProtocol> {
        self { SettingsInteractor() }
    }
    
    // MARK: - Settings ViewController Factories
    var settingsViewControllerFactory: Factory<SettingsViewControllerFactoryProtocol> {
        self { SettingsViewControllerFactory(container: self) }
    }
    
    var notificationSettingsViewControllerFactory: Factory<NotificationSettingsViewControllerFactoryProtocol> {
        self { NotificationSettingsViewControllerFactory() }
    }
    
    // MARK: - Settings Coordinator Factory
    var settingsCoordinatorFactory: Factory<SettingsCoordinatorFactoryProtocol> {
        self {
            SettingsCoordinatorFactory(
                settingsFactory: self.settingsViewControllerFactory(),
                notificationSettingsFactory: self.notificationSettingsViewControllerFactory()
            )
        }
    }
}
