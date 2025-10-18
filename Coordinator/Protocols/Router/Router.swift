//
//  Router.swift
//  MyCoordinatorPattern
//

import UIKit

/// Delegate to notify when a view controller is popped via back button
protocol RouterDelegate: AnyObject {
    func router(_ router: Router, didPopViewController viewController: UIViewController)
}

/// Protocol defining navigation operations
/// Router is passive - it just executes navigation commands and monitors navigation events
protocol Router: AnyObject {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    var delegate: RouterDelegate? { get set }
    
    // MARK: - Push/Pop Operations
    func push(_ viewController: UIViewController, animated: Bool)
    func push(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func pop(animated: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)
    func popToRoot(animated: Bool, completion: (() -> Void)?)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    
    // MARK: - Present/Dismiss Operations
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    
    // MARK: - Custom Transitions
    func pushWithCustomTransition(_ viewController: UIViewController, transition: UINavigationController.VCTransition)
    
    // MARK: - Set Root
    func setRootViewController(_ viewController: UIViewController, animated: Bool)
}

