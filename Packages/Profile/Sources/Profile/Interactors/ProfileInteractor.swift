//
//  ProfileInteractor.swift
//  Coordinator
//

import Common
import Foundation

protocol ProfileInteractorProtocol {
    func loadUserProfile() async throws -> User
    func updateUserProfile(user: User) async throws
}

final class ProfileInteractor: ProfileInteractorProtocol {
    init() {}

    func loadUserProfile() async throws -> User {
        User()
    }

    func updateUserProfile(user: User) async throws {
        // In a real app, update via API
    }
}
