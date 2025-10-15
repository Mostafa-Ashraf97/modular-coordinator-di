//
//  ProfileDetailsViewModel.swift
//  MyCoordinatorPattern
//

import Foundation
import Combine

protocol ProfileDetailsViewModelProtocol: ObservableObject {
    // Add properties/methods as needed
}

final class ProfileDetailsViewModel: ProfileDetailsViewModelProtocol {
    
    private weak var coordinator: ProfileCoordinatorActions?
    
    init(coordinator: ProfileCoordinatorActions) {
        self.coordinator = coordinator
    }
}

