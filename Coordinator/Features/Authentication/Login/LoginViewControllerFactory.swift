//
//  LoginViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI
import Factory

protocol LoginViewControllerFactoryProtocol {
    func makeLoginViewController(coordinator: LoginCoordinatorActions) -> UIViewController
}

final class LoginViewControllerFactory: LoginViewControllerFactoryProtocol {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func makeLoginViewController(coordinator: LoginCoordinatorActions) -> UIViewController {
        let interactor = container.loginInteractor()
        let viewModel = LoginViewModel(coordinator: coordinator, interactor: interactor)
        let view = LoginView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
