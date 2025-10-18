//
//  AuthRepositoryProtocol.swift
//  Coordinator
//

import Foundation
import Common

protocol AuthRepositoryProtocol {
    func getUserToken() async throws -> String
    func login() async throws -> User
    func register(newUser: User) async throws -> User
    func sendNewPassword() async throws
}

