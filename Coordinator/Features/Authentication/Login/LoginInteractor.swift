//
//  LoginInteractor.swift
//  MyCoordinatorPattern
//

import Foundation

protocol LoginInteractorProtocol {
    func performLogin() async throws -> User
}

final class LoginInteractor: LoginInteractorProtocol {
    
    private let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func performLogin() async throws -> User {
        return try await authRepository.login()
    }
}
