//
//  AuthFlowCoordinatorProtocol.swift
//  Coordinator
//

/// Protocol for the authentication flow coordinator
public protocol AuthFlowCoordinatorProtocol: ChildCoordinator {
    /// Closure called when authentication succeeds with the authenticated user
    var onAuthenticationSuccess: ((User) -> ())? { get set }
}
