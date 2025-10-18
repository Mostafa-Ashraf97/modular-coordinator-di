//
//  ProfileCoordinatorFactoryProtocol.swift
//  Coordinator
//

public protocol ProfileCoordinatorFactoryProtocol {
    func makeProfileCoordinator(router: Router) -> ProfileFlowCoordinatorProtocol
}
