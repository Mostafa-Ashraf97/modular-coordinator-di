//
//  AuthRepository.swift
//  CleanCoordinatorApp
//

import Foundation

final class AuthRepository: AuthRepositoryProtocol {
    
    func getUserToken() async throws -> String {
        // Placeholder implementation
        return "mock_token"
    }
    
    func login() async throws -> User {
        // Placeholder implementation
        try await Task.sleep(nanoseconds: 1_000_000_000)
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        return User(firstName: "John", lastName: "Doe")
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

