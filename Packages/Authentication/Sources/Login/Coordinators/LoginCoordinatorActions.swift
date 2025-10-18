//
//  LoginCoordinatorActions.swift
//  Coordinator
//

import Foundation
import Common

protocol LoginCoordinatorActions: AnyObject {
    func loginSuccess(user: User)
    func navigateToForgotPassword()
    func navigateToRegister()
}

