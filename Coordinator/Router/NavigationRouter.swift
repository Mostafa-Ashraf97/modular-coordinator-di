//
//  NavigationRouter.swift
//  MyCoordinatorPattern
//

import UIKit

/// Concrete implementation of Router that uses UINavigationController
/// This is a passive component that executes navigation operations and monitors navigation events
final class NavigationRouter: NSObject, Router {
    
    // MARK: - Properties
    let navigationController: UINavigationController
    weak var delegate: RouterDelegate?
    
    var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
    
    deinit {
        if navigationController.delegate === self {
            navigationController.delegate = nil
        }
    }
    
    // MARK: - Push/Pop Operations
    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func push(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        navigationController.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func pop(animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        navigationController.popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func popToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        navigationController.popToRootViewController(animated: animated)
        CATransaction.commit()
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController.popToViewController(viewController, animated: animated)
    }
    
    // MARK: - Present/Dismiss Operations
    func present(_ viewController: UIViewController, animated: Bool) {
        navigationController.present(viewController, animated: animated)
    }
    
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool) {
        navigationController.dismiss(animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    // MARK: - Custom Transitions
    func pushWithCustomTransition(_ viewController: UIViewController, transition: UINavigationController.VCTransition) {
        navigationController.customPushViewController(viewController: viewController, direction: transition)
    }
    
    // MARK: - Set Root
    func setRootViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController.setViewControllers([viewController], animated: animated)
    }
}

// MARK: - UINavigationControllerDelegate
extension NavigationRouter: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                            didShow viewController: UIViewController,
                            animated: Bool) {
        
        // Get the view controller we're transitioning FROM
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(fromViewController) else {
            return
        }
        
        // Notify delegate that a view controller was popped
        delegate?.router(self, didPopViewController: fromViewController)
    }
}

