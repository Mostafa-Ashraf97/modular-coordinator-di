//
//  HomepageViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI
import Factory

protocol HomepageViewControllerFactoryProtocol {
    func makeHomepageViewController(coordinator: HomepageCoordinatorActions) -> UIViewController
}

final class HomepageViewControllerFactory: HomepageViewControllerFactoryProtocol {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func makeHomepageViewController(coordinator: HomepageCoordinatorActions) -> UIViewController {
        let interactor = container.homepageInteractor()
        let viewModel = HomepageViewModel(coordinator: coordinator, interactor: interactor)
        let view = HomepageView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
