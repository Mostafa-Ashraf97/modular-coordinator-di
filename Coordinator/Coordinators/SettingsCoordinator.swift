//
//  SettingsCoordinator.swift
//  MyCoordinatorPattern
//

import Foundation
import UIKit

final class SettingsCoordinator: SettingsFlowCoordinatorProtocol {
    
    // MARK: - ChildCoordinator
    weak var finishDelegate: CoordinatorFinishDelegate?
    private(set) weak var rootViewController: UIViewController?
    
    // MARK: - Coordinator
    var navigationController: UINavigationController
    
    // MARK: - Dependencies
    private let settingsFactory: SettingsViewControllerFactoryProtocol
    private let notificationSettingsFactory: NotificationSettingsViewControllerFactoryProtocol
    
    init(
        navigationController: UINavigationController,
        settingsFactory: SettingsViewControllerFactoryProtocol,
        notificationSettingsFactory: NotificationSettingsViewControllerFactoryProtocol
    ) {
        self.navigationController = navigationController
        self.settingsFactory = settingsFactory
        self.notificationSettingsFactory = notificationSettingsFactory
    }
    
    func start() {
        let settingsVC = settingsFactory.makeSettingsViewController(coordinator: self)
        rootViewController = settingsVC
        navigationController.pushViewController(settingsVC, animated: true)
    }
}

// MARK: - SettingsCoordinatorActions
extension SettingsCoordinator: SettingsCoordinatorActions {
    
    func navigateToNotificationSettings() {
        let notificationVC = notificationSettingsFactory.makeNotificationSettingsViewController(coordinator: self)
        navigationController.pushViewController(notificationVC, animated: true)
    }
}


