//
//  RegistrationViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI
import Factory

protocol RegistrationViewControllerFactoryProtocol {
    func makeRegistrationViewController(coordinator: RegistrationIntroCoordinatorActions) -> UIViewController
}

final class RegistrationViewControllerFactory: RegistrationViewControllerFactoryProtocol {
    
    func makeRegistrationViewController(coordinator: RegistrationIntroCoordinatorActions) -> UIViewController {
        let viewModel = RegistrationViewModel(coordinator: coordinator)
        let view = RegisterView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
