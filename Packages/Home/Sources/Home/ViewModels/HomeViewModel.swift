//
//  HomeViewModel.swift
//  Coordinator
//

import Foundation
import Combine

protocol HomeViewModelProtocol: ObservableObject {
    func navigateToProfile()
    func navigateToSettings()
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private weak var coordinator: HomeCoordinatorActions?
    private let interactor: HomeInteractorProtocol
    
    init(coordinator: HomeCoordinatorActions, interactor: HomeInteractorProtocol) {
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
