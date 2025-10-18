//
//  RegistrationViewModel.swift
//  Coordinator
//

import Foundation
import Common

protocol RegistrationViewModelProtocol: ObservableObject {
    func continueToGenderSelection(firstName: String, lastName: String)
}

final class RegistrationViewModel: RegistrationViewModelProtocol {
    
    private weak var coordinator: RegistrationCoordinatorActions?
    private let interactor: RegistrationInteractorProtocol
    
    init(coordinator: RegistrationCoordinatorActions, interactor: RegistrationInteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    func continueToGenderSelection(firstName: String, lastName: String) {
        var user = User()
        user.firstName = firstName
        user.lastName = lastName
        coordinator?.registerFinished(newUser: user)
    }
}
