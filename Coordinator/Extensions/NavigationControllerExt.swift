//
//  NavigationControllerExt.swift
//  CleanCoordinatorApp
//

import UIKit

extension UINavigationController {
    
    enum VCTransition {
        case fromRight
        case fromLeft
        case fromTop
        case fromBottom
    }
    
    func customPushViewController(viewController: UIViewController, direction: VCTransition = .fromRight) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        
        switch direction {
        case .fromRight:
            transition.subtype = .fromRight
        case .fromLeft:
            transition.subtype = .fromLeft
        case .fromTop:
            transition.subtype = .fromTop
        case .fromBottom:
            transition.subtype = .fromBottom
        }
        
        view.layer.add(transition, forKey: kCATransition)
        pushViewController(viewController, animated: false)
    }
    
    func customPopViewController(transitionType: CATransitionType = .push) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = transitionType
        transition.subtype = .fromTop
        view.layer.add(transition, forKey: kCATransition)
        popViewController(animated: false)
    }
    
    func customPopToViewController(viewController: UIViewController, transitionType: CATransitionType = .push) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = transitionType
        transition.subtype = .fromTop
        view.layer.add(transition, forKey: kCATransition)
        popToViewController(viewController, animated: false)
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let viewController = viewControllers.first(where: { type(of: $0) == ofClass }) {
            popToViewController(viewController, animated: animated)
        }
    }
}

