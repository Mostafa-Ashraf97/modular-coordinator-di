//
//  RegistrationViewModel.swift
//  MyCoordinatorPattern
//

import Foundation
import Combine

protocol RegistrationViewModelProtocol: ObservableObject {
    func continueToGenderSelection(firstName: String, lastName: String)
}

final class RegistrationViewModel: RegistrationViewModelProtocol {
    
    private weak var coordinator: RegistrationIntroCoordinatorActions?
    
    init(coordinator: RegistrationIntroCoordinatorActions) {
        self.coordinator = coordinator
    }
    
    func continueToGenderSelection(firstName: String, lastName: String) {
        var user = User()
        user.firstName = firstName
        user.lastName = lastName
        coordinator?.registerIntroFinished(newUser: user)
    }
}
