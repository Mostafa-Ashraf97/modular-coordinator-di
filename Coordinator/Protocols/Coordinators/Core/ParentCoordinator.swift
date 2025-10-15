//
//  ParentCoordinator.swift
//  CleanCoordinatorApp
//

import UIKit

/// Protocol for coordinators that can have child coordinators
protocol ParentCoordinator: Coordinator, CoordinatorFinishDelegate {
    var childCoordinators: [ChildCoordinator] { get set }
    func addChildCoordinator(_ child: ChildCoordinator?)
    func removeChildCoordinator(_ child: ChildCoordinator?)
}

extension ParentCoordinator {
    
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


// MARK: - UINavigationControllerDelegate Default Implementation
extension ParentCoordinator where Self: UINavigationControllerDelegate {
    
    /// Default implementation for UINavigationControllerDelegate
    /// Automatically cleans up child coordinators when their root view controller is popped
    func navigationController(_ navigationController: UINavigationController,
                            didShow viewController: UIViewController,
                            animated: Bool) {
        
        // Get the view controller we're transitioning FROM
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(fromViewController) else {
            return
        }
        
        // Check if any child coordinator's root view controller was popped
        for childCoordinator in childCoordinators {
            if childCoordinator.rootViewController === fromViewController {
                coordinatorDidFinish(childCoordinator: childCoordinator)
                return
            }
        }
    }
}
