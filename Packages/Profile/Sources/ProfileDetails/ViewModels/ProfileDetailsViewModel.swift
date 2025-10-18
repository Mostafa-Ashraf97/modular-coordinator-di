//
//  ProfileDetailsViewModel.swift
//  Coordinator
//

import Foundation
import Combine

protocol ProfileDetailsViewModelProtocol: ObservableObject {
    // Add properties/methods as needed
}

final class ProfileDetailsViewModel: ProfileDetailsViewModelProtocol {
    
    private weak var coordinator: ProfileDetailsCoordinatorActions?
    
    init(coordinator: ProfileDetailsCoordinatorActions) {
        self.coordinator = coordinator
    }
}

