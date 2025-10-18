//
//  CoordinatorFinishDelegate.swift
//  Coordinator
//

/// Delegate protocol for coordinators to notify when they finish
public protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: ChildCoordinator)
}
