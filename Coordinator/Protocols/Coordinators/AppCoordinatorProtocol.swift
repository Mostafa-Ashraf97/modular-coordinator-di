//
//  AppCoordinatorProtocol.swift
//  CleanCoordinatorApp
//

import UIKit

/// Protocol for the root app coordinator
protocol AppCoordinatorProtocol: ParentCoordinator {
    func configure(with windowScene: UIWindowScene)
}
