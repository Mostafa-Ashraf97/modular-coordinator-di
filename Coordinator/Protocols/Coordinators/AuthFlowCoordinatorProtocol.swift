//
//  AuthFlowCoordinatorProtocol.swift
//  CleanCoordinatorApp
//

import Foundation

/// Protocol for the authentication flow coordinator
protocol AuthFlowCoordinatorProtocol: ChildCoordinator {
    /// Closure called when authentication succeeds with the authenticated user
    var onAuthenticationSuccess: ((User) -> Void)? { get set }
}
