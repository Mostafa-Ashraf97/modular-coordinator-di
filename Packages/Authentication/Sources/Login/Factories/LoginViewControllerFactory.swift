//
//  LoginViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol LoginViewControllerFactoryProtocol {
    func makeLoginViewController(coordinator: LoginCoordinatorActions) -> UIViewController
}

struct LoginViewControllerFactory: LoginViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeLoginViewController(coordinator: LoginCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(LoginInteractorProtocol.self)!
        let viewModel = LoginViewModel(coordinator: coordinator, interactor: interactor)
        let view = LoginView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
