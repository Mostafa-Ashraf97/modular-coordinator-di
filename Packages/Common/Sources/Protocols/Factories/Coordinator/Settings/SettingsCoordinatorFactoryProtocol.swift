//
//  SettingsCoordinatorFactoryProtocol.swift
//  Coordinator
//

public protocol SettingsCoordinatorFactoryProtocol {
    func makeSettingsCoordinator(router: Router) -> SettingsFlowCoordinatorProtocol
}
