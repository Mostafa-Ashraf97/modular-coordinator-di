//
//  SplashViewModel.swift
//  Coordinator
//

import Foundation
import Combine

protocol SplashViewModelProtocol: ObservableObject {
    func onAppear()
}

final class SplashViewModel: SplashViewModelProtocol {
    
    private weak var coordinator: SplashCoordinatorActions?
    private let interactor: SplashInteractorProtocol
    
    init(coordinator: SplashCoordinatorActions, interactor: SplashInteractorProtocol) {
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.checkUserStatus()
        }
    }
    
    private func checkUserStatus() {
        let isLoggedIn = interactor.isUserConnected()
        let user = interactor.getCurrentUser()
        coordinator?.navigateFromSplash(isLoggedIn: isLoggedIn, user: user)
    }
}
