//
//  SplashCoordinatorActions.swift
//  MyCoordinatorPattern
//

import Foundation

protocol SplashCoordinatorActions: AnyObject {
    func navigateFromSplash(isLoggedIn: Bool, user: User?)
}

