//
//  SplashViewControllerFactory.swift
//  Coordinator
//

import Common
import SwiftUI
import Swinject
import UIKit

protocol SplashViewControllerFactoryProtocol {
    func makeSplashViewController(coordinator: SplashCoordinatorActions) -> UIViewController
}

struct SplashViewControllerFactory: SplashViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeSplashViewController(coordinator: SplashCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(SplashInteractorProtocol.self)!
        let viewModel = SplashViewModel(coordinator: coordinator, interactor: interactor)
        let view = SplashView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
