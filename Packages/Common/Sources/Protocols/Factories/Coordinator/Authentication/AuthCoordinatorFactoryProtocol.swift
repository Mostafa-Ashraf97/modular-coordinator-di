//
//  AuthCoordinatorFactoryProtocol.swift
//  Coordinator
//

public protocol AuthCoordinatorFactoryProtocol {
    func makeAuthCoordinator(router: Router) -> AuthFlowCoordinatorProtocol
}
