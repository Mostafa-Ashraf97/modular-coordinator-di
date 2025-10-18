//
//  RegistrationCoordinatorActions.swift
//  Coordinator
//

import Foundation
import Common

protocol RegistrationCoordinatorActions: AnyObject {
    func registerFinished(newUser: User)
}

