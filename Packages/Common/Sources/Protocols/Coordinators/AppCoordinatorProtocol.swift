//
//  AppCoordinatorProtocol.swift
//  Coordinator
//

import UIKit

/// Protocol for the root app coordinator
public protocol AppCoordinatorProtocol: ParentCoordinator {
    func configure(with windowScene: UIWindowScene)
}
