//
//  AuthRepositoryProtocol.swift
//  CleanCoordinatorApp
//

import Foundation

protocol AuthRepositoryProtocol {
    func getUserToken() async throws -> String
    func login() async throws -> User
    func register(newUser: User) async throws -> User
    func sendNewPassword() async throws
}

