//
//  ForgotPasswordInteractor.swift
//  Coordinator
//

import Foundation

protocol ForgotPasswordInteractorProtocol {
    func sendResetPasswordEmail() async throws
}

final class ForgotPasswordInteractor: ForgotPasswordInteractorProtocol {
    private let authRepository: AuthRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    func sendResetPasswordEmail() async throws {
        try await authRepository.sendNewPassword()
    }
}
