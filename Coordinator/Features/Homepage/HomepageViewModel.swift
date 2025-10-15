//
//  HomepageViewModel.swift
//  MyCoordinatorPattern
//

import Foundation
import Combine

protocol HomepageViewModelProtocol: ObservableObject {
    func navigateToProfile()
    func navigateToSettings()
}

final class HomepageViewModel: HomepageViewModelProtocol {
    
    private weak var coordinator: HomepageCoordinatorActions?
    private let interactor: HomepageInteractorProtocol
    
    init(coordinator: HomepageCoordinatorActions, interactor: HomepageInteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    func navigateToProfile() {
        coordinator?.navigateToProfile()
    }
    
    func navigateToSettings() {
        coordinator?.navigateToSettings()
    }
}
