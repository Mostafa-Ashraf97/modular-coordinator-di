//
//  HomeViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol HomeViewControllerFactoryProtocol {
    func makeHomeViewController(coordinator: HomeCoordinatorActions) -> UIViewController
}

struct HomeViewControllerFactory: HomeViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeHomeViewController(coordinator: HomeCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(HomeInteractorProtocol.self)!
        let viewModel = HomeViewModel(coordinator: coordinator, interactor: interactor)
        let view = HomeView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
