//
//  ProfileDetailsViewControllerFactory.swift
//  Coordinator
//

import SwiftUI
import Swinject
import UIKit

protocol ProfileDetailsViewControllerFactoryProtocol {
    func makeProfileDetailsViewController(coordinator: ProfileDetailsCoordinatorActions) -> UIViewController
}

struct ProfileDetailsViewControllerFactory: ProfileDetailsViewControllerFactoryProtocol {
    let resolver: Resolver

    func makeProfileDetailsViewController(coordinator: ProfileDetailsCoordinatorActions) -> UIViewController {
        let viewModel = ProfileDetailsViewModel(coordinator: coordinator)
        let view = ProfileDetailsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
