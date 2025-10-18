//
//  ForgotPasswordViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol ForgotPasswordViewControllerFactoryProtocol {
    func makeForgotPasswordViewController(coordinator: ForgotPasswordCoordinatorActions) -> UIViewController
}

struct ForgotPasswordViewControllerFactory: ForgotPasswordViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeForgotPasswordViewController(coordinator: ForgotPasswordCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(ForgotPasswordInteractorProtocol.self)!
        let viewModel = ForgotPasswordViewModel(coordinator: coordinator, interactor: interactor)
        let view = ForgotPasswordView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
