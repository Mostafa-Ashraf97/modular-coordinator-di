//
//  RegistrationViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol RegistrationViewControllerFactoryProtocol {
    func makeRegistrationViewController(coordinator: RegistrationCoordinatorActions) -> UIViewController
}

struct RegistrationViewControllerFactory: RegistrationViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeRegistrationViewController(coordinator: RegistrationCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(RegistrationInteractorProtocol.self)!
        let viewModel = RegistrationViewModel(coordinator: coordinator, interactor: interactor)
        let view = RegisterView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
