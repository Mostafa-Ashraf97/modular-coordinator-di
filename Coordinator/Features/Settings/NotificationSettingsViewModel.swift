//
//  NotificationSettingsViewModel.swift
//  MyCoordinatorPattern
//

import Foundation
import Combine

protocol NotificationSettingsViewModelProtocol: ObservableObject {
    // Add properties/methods as needed
}

final class NotificationSettingsViewModel: NotificationSettingsViewModelProtocol {
    
    private weak var coordinator: SettingsCoordinatorActions?
    
    init(coordinator: SettingsCoordinatorActions) {
        self.coordinator = coordinator
    }
}

