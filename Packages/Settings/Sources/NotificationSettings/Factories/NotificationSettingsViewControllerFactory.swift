//
//  NotificationSettingsViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol NotificationSettingsViewControllerFactoryProtocol {
    func makeNotificationSettingsViewController(coordinator: NotificationSettingsCoordinatorActions) -> UIViewController
}

struct NotificationSettingsViewControllerFactory: NotificationSettingsViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeNotificationSettingsViewController(coordinator: NotificationSettingsCoordinatorActions) -> UIViewController {
        let viewModel = NotificationSettingsViewModel(coordinator: coordinator)
        let view = NotificationSettingsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
