//
//  SettingsViewModel.swift
//  MyCoordinatorPattern
//

import Foundation
import Combine

protocol SettingsViewModelProtocol: ObservableObject {
    func navigateToNotifications()
}

final class SettingsViewModel: SettingsViewModelProtocol {
    
    private weak var coordinator: SettingsCoordinatorActions?
    private let interactor: SettingsInteractorProtocol
    
    init(coordinator: SettingsCoordinatorActions, interactor: SettingsInteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    func navigateToNotifications() {
        coordinator?.navigateToNotificationSettings()
    }
}

