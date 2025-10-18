//
//  ParentCoordinator.swift
//  Coordinator
//

import UIKit

/// Protocol for coordinators that can have child coordinators
public protocol ParentCoordinator: Coordinator, CoordinatorFinishDelegate, RouterDelegate {
    var childCoordinators: [ChildCoordinator] { get set }
    func addChildCoordinator(_ child: ChildCoordinator?)
    func removeChildCoordinator(_ child: ChildCoordinator?)
}

public extension ParentCoordinator {
    
    func addChildCoordinator(_ child: ChildCoordinator?) {
        guard let child = child else { return }
        
        // Prevent adding the same coordinator twice
        guard !childCoordinators.contains(where: { $0 === child }) else { return }
        
        childCoordinators.append(child)
    }
    
    func removeChildCoordinator(_ child: ChildCoordinator?) {
        guard let child = child,
              let index = childCoordinators.firstIndex(where: { $0 === child }) else { return }
        
        childCoordinators.remove(at: index)
    }
        
    // MARK: - CoordinatorFinishDelegate
    func coordinatorDidFinish(childCoordinator: ChildCoordinator) {
        removeChildCoordinator(childCoordinator)
    }
}

// MARK: - RouterDelegate Default Implementation
public extension ParentCoordinator {
    
    /// Default implementation for RouterDelegate
    /// Automatically cleans up child coordinators when their root view controller is popped
    func router(_ router: Router, didPopViewController viewController: UIViewController) {
        // Check if any child coordinator's root view controller was popped
        for childCoordinator in childCoordinators {
            if childCoordinator.rootViewController === viewController {
                coordinatorDidFinish(childCoordinator: childCoordinator)
                return
            }
        }
    }
}