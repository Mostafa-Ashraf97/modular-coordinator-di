//
//  SettingsViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol SettingsViewControllerFactoryProtocol {
    func makeSettingsViewController(coordinator: SettingsCoordinatorActions) -> UIViewController
}

struct SettingsViewControllerFactory: SettingsViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeSettingsViewController(coordinator: SettingsCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(SettingsInteractorProtocol.self)!
        let viewModel = SettingsViewModel(coordinator: coordinator, interactor: interactor)
        let view = SettingsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
