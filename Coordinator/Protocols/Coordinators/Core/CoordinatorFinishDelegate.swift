//
//  CoordinatorFinishDelegate.swift
//  Coordinator
//

import Foundation

/// Delegate protocol for coordinators to notify when they finish
protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: ChildCoordinator)
}

