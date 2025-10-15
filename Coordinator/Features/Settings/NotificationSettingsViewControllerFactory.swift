//
//  NotificationSettingsViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI

protocol NotificationSettingsViewControllerFactoryProtocol {
    func makeNotificationSettingsViewController(coordinator: SettingsCoordinatorActions) -> UIViewController
}

final class NotificationSettingsViewControllerFactory: NotificationSettingsViewControllerFactoryProtocol {
    
    func makeNotificationSettingsViewController(coordinator: SettingsCoordinatorActions) -> UIViewController {
        let viewModel = NotificationSettingsViewModel(coordinator: coordinator)
        let view = NotificationSettingsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
