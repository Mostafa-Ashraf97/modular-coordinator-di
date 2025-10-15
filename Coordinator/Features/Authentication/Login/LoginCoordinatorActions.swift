//
//  LoginCoordinatorActions.swift
//  MyCoordinatorPattern
//

import Foundation

protocol LoginCoordinatorActions: AnyObject {
    func loginSuccess(user: User)
    func navigateToForgotPassword()
    func navigateToRegister()
}

