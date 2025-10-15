//
//  ProfileInteractor.swift
//  MyCoordinatorPattern
//

import Foundation

protocol ProfileInteractorProtocol {
    func loadUserProfile() async throws -> User
    func updateUserProfile(user: User) async throws
}

final class ProfileInteractor: ProfileInteractorProtocol {
    
    func loadUserProfile() async throws -> User {
        return User()
    }
    
    func updateUserProfile(user: User) async throws {
        // In a real app, update via API
    }
}
