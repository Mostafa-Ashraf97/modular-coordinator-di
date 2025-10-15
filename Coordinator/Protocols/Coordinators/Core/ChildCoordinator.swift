//
//  ChildCoordinator.swift
//  CleanCoordinatorApp
//

import UIKit

/// Protocol for coordinators that are children of a parent coordinator
protocol ChildCoordinator: Coordinator {
    /// The root view controller of this coordinator flow
    var rootViewController: UIViewController? { get }
    
    /// Delegate to notify when this coordinator finishes
    var finishDelegate: CoordinatorFinishDelegate? { get set }
}

// MARK: - Default Implementation
extension ChildCoordinator {
    
    /// Notifies the delegate that this coordinator has finished
    /// Call this when the coordinator's flow is complete
    func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
