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
    let router: Router
    
    // MARK: - Dependencies
    private let settingsFactory: SettingsViewControllerFactoryProtocol
    private let notificationSettingsFactory: NotificationSettingsViewControllerFactoryProtocol
    
    init(
        router: Router,
        settingsFactory: SettingsViewControllerFactoryProtocol,
        notificationSettingsFactory: NotificationSettingsViewControllerFactoryProtocol
    ) {
        self.router = router
        self.settingsFactory = settingsFactory
        self.notificationSettingsFactory = notificationSettingsFactory
    }
    
    func start() {
        let settingsVC = settingsFactory.makeSettingsViewController(coordinator: self)
        rootViewController = settingsVC
        router.push(settingsVC, animated: true)
    }
}

// MARK: - SettingsCoordinatorActions
extension SettingsCoordinator: SettingsCoordinatorActions {
    
    func navigateToNotificationSettings() {
        let notificationVC = notificationSettingsFactory.makeNotificationSettingsViewController(coordinator: self)
        router.push(notificationVC, animated: true)
    }
}


