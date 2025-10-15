//
//  SplashViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI
import Factory

protocol SplashViewControllerFactoryProtocol {
    func makeSplashViewController(coordinator: SplashCoordinatorActions) -> UIViewController
}

final class SplashViewControllerFactory: SplashViewControllerFactoryProtocol {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func makeSplashViewController(coordinator: SplashCoordinatorActions) -> UIViewController {
        let interactor = container.splashInteractor()
        let viewModel = SplashViewModel(coordinator: coordinator, interactor: interactor)
        let view = SplashView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
