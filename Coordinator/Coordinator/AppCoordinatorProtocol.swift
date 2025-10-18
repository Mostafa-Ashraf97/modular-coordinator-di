//
//  AppCoordinatorProtocol.swift
//  Coordinator
//

import UIKit
import Common

/// Protocol for the root app coordinator
protocol AppCoordinatorProtocol: ParentCoordinator {
    func configure(with windowScene: UIWindowScene)
}
