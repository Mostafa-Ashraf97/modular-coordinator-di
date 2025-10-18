//
//  ProfileViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol ProfileViewControllerFactoryProtocol {
    func makeProfileViewController(coordinator: ProfileCoordinatorActions) -> UIViewController
}

struct ProfileViewControllerFactory: ProfileViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeProfileViewController(coordinator: ProfileCoordinatorActions) -> UIViewController {
        let interactor = resolver.resolve(ProfileInteractorProtocol.self)!
        let viewModel = ProfileViewModel(coordinator: coordinator, interactor: interactor)
        let view = ProfileView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
