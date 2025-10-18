//
//  NotificationSettingsViewModel.swift
//  Coordinator
//

import Foundation
import Combine

protocol NotificationSettingsViewModelProtocol: ObservableObject {
    // Add properties/methods as needed
}

final class NotificationSettingsViewModel: NotificationSettingsViewModelProtocol {
    
    private weak var coordinator: NotificationSettingsCoordinatorActions?
    
    init(coordinator: NotificationSettingsCoordinatorActions) {
        self.coordinator = coordinator
    }
}

