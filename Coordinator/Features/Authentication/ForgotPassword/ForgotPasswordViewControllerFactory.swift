//
//  ForgotPasswordViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI
import Factory

protocol ForgotPasswordViewControllerFactoryProtocol {
    func makeForgotPasswordViewController(coordinator: ForgotPasswordCoordinatorActions) -> UIViewController
}

final class ForgotPasswordViewControllerFactory: ForgotPasswordViewControllerFactoryProtocol {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func makeForgotPasswordViewController(coordinator: ForgotPasswordCoordinatorActions) -> UIViewController {
        let interactor = container.forgotPasswordInteractor()
        let viewModel = ForgotPasswordViewModel(coordinator: coordinator, interactor: interactor)
        let view = ForgotPasswordView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
