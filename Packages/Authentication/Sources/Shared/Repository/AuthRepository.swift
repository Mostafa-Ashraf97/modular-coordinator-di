//
//  AuthRepository.swift
//  Coordinator
//

import Foundation
import Common

final class AuthRepository: AuthRepositoryProtocol {
    
    init() {}
    
    func getUserToken() async throws -> String {
        // Placeholder implementation
        return "mock_token"
    }
    
    func login() async throws -> User {
        // Placeholder implementation
        try await Task.sleep(nanoseconds: 1_000_000_000)
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        return User()
    }
    
    func register(newUser: User) async throws -> User {
        // Placeholder implementation
        try await Task.sleep(nanoseconds: 1_000_000_000)
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        return newUser
    }
    
    func sendNewPassword() async throws {
        // Placeholder implementation
        try await Task.sleep(nanoseconds: 1_000_000_000)
    }
}

