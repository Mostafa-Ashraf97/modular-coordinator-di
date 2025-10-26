//
//  SplashCoordinatorActions.swift
//  Coordinator
//

import Foundation
import Common

 protocol SplashCoordinatorActions: AnyObject {
    func navigateFromSplash(isLoggedIn: Bool, user: User?)
}

