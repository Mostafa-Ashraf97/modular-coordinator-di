//
//  ProfileViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI
import Factory

protocol ProfileViewControllerFactoryProtocol {
    func makeProfileViewController(coordinator: ProfileCoordinatorActions) -> UIViewController
}

final class ProfileViewControllerFactory: ProfileViewControllerFactoryProtocol {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func makeProfileViewController(coordinator: ProfileCoordinatorActions) -> UIViewController {
        let interactor = container.profileInteractor()
        let viewModel = ProfileViewModel(coordinator: coordinator, interactor: interactor)
        let view = ProfileView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
