//
//  RegistrationInteractor.swift
//  Coordinator
//

import Foundation
import Common

 protocol RegistrationInteractorProtocol {
    func validateRegistration() async throws
    func createAccount(user: User) async throws -> User
}

 final class RegistrationInteractor: RegistrationInteractorProtocol {
    
    private let authRepository: AuthRepositoryProtocol
    
     init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
     func validateRegistration() async throws {
        // Add validation logic
    }
    
     func createAccount(user: User) async throws -> User {
        return try await authRepository.register(newUser: user)
    }
}
