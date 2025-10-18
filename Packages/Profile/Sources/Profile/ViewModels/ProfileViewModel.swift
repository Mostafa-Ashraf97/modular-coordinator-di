//
//  ProfileViewModel.swift
//  Coordinator
//

import Foundation
import Combine

protocol ProfileViewModelProtocol: ObservableObject {
    func navigateToDetails()
}

final class ProfileViewModel: ProfileViewModelProtocol {
    
    private weak var coordinator: ProfileCoordinatorActions?
    private let interactor: ProfileInteractorProtocol
    
    init(coordinator: ProfileCoordinatorActions, interactor: ProfileInteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    func navigateToDetails() {
        coordinator?.navigateToProfileDetails()
    }
}
