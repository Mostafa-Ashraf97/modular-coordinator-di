//
//  SplashInteractor.swift
//  MyCoordinatorPattern
//

import Foundation

protocol SplashInteractorProtocol {
    func isUserConnected() -> Bool
    func getCurrentUser() -> User?
}

final class SplashInteractor: SplashInteractorProtocol {
    
    func isUserConnected() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func getCurrentUser() -> User? {
        guard isUserConnected() else { return nil }
        return User()
    }
}
