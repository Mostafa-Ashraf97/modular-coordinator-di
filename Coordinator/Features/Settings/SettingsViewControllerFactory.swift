//
//  SettingsViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI
import Factory

protocol SettingsViewControllerFactoryProtocol {
    func makeSettingsViewController(coordinator: SettingsCoordinatorActions) -> UIViewController
}

final class SettingsViewControllerFactory: SettingsViewControllerFactoryProtocol {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func makeSettingsViewController(coordinator: SettingsCoordinatorActions) -> UIViewController {
        let interactor = container.settingsInteractor()
        let viewModel = SettingsViewModel(coordinator: coordinator, interactor: interactor)
        let view = SettingsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
