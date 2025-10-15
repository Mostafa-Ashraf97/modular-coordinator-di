//
//  ProfileDetailsViewControllerFactory.swift
//  MyCoordinatorPattern
//

import UIKit
import SwiftUI

protocol ProfileDetailsViewControllerFactoryProtocol {
    func makeProfileDetailsViewController(coordinator: ProfileCoordinatorActions) -> UIViewController
}

final class ProfileDetailsViewControllerFactory: ProfileDetailsViewControllerFactoryProtocol {
    
    func makeProfileDetailsViewController(coordinator: ProfileCoordinatorActions) -> UIViewController {
        let viewModel = ProfileDetailsViewModel(coordinator: coordinator)
        let view = ProfileDetailsView(viewModel: viewModel)
        return UIHostingController(rootView: view)
    }
}
