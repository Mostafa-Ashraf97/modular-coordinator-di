//
//  SplashInteractor.swift
//  Coordinator
//

import Common
import Foundation

protocol SplashInteractorProtocol {
    func isUserConnected() -> Bool
    func getCurrentUser() -> User?
}

final class SplashInteractor: SplashInteractorProtocol {
    init() {}

    func isUserConnected() -> Bool {
        UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    func getCurrentUser() -> User? {
        guard isUserConnected() else { return nil }
        return User()
    }
}
