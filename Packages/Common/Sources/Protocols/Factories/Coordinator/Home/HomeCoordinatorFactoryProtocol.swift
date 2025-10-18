//
//  HomeCoordinatorFactoryProtocol.swift
//  Coordinator
//

public protocol HomeCoordinatorFactoryProtocol {
    func makeHomeCoordinator(router: Router) -> HomeFlowCoordinatorProtocol
}
