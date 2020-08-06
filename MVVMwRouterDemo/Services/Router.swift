//
//  Router.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 28/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import Foundation
import UIKit

// MARK:- View Controller Configurator Protocol
protocol VCConfig {
    /// An associatedType RequiredParams (no-type until protocol is adopted).
    associatedtype RequiredParams
    /// Function configure accepting a paramater of type RequiredParams
    func config(with params: RequiredParams)
}

class Router {

    // MARK:- Enum
    enum NavigationAction {
        case push, pop, present, dismiss
    }
    
    // MARK:- Singleton
    private init() {}
    static let shared = Router()
    
    // MARK:- Main Navigation
    /// Main navigation encapsulated inside Router class
    let mainNav: UINavigationController = {
        let navigation = UINavigationController()
        return navigation
    }()
    
    /// Navigate to a VC Type conforming to VCConfig Protocol
    /// - parameter to: A VC Type of UIViewController which conforms to VCConfig Protocol
    /// - parameter action: A case from NavigationAction enum
    /// - parameter closure: A generic type U to return the requirements of (to) VC
    func navigate <T: UIViewController & VCConfig, U: Any> (to: T.Type, action: NavigationAction, closure: (() -> U)?) {
        
        // FIXME: T is not accessible for delegation or calling closures
        switch action {
            
        case .push, .present:
            
            let toVC = T.init(nibName: nil, bundle: nil)
            
            if let params = closure?() as? T.RequiredParams {
                toVC.config(with: params)
            }
            
            if action == .push {
                self.mainNav.pushViewController(toVC, animated: true)
            } else {
                self.mainNav.present(toVC, animated: true, completion: nil)
            }
            
        case .pop, .dismiss:
            
            guard let toVC = self.mainNav.viewControllers.last(where: {$0 is T}) else { return }
            if action == .pop {
                self.mainNav.popToViewController(toVC, animated: true)
            } else {
                toVC.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    /// Navigate to a View Controller
    /// - parameter vc: Any view controller object or can be nil
    /// - parameter action: A case from NavigationAction enum
    func navigate(vc: UIViewController? = nil,
                  action: NavigationAction = .push) {
        
        switch action {
        case .push, .present:
            guard let vc = vc else { return }
            
            if action == .push {
                self.mainNav.dismiss(animated: true, completion: nil)
                self.mainNav.pushViewController(vc, animated: true)
            } else {
                self.mainNav.present(vc, animated: true, completion: nil)
            }
            
        case .pop, .dismiss:
            guard let vc = vc else {
                if action == .pop {
                    self.mainNav.popViewController(animated: true)
                } else if action == .dismiss {
                    self.mainNav.dismiss(animated: true, completion: nil)
                }
                return
            }
            
            guard let toVC = self.mainNav.viewControllers.last(where: {$0 === vc}) else { return }
            if action == .pop {
                self.mainNav.popToViewController(toVC, animated: true)
            } else {
                toVC.dismiss(animated: true, completion: nil)
            }
        }
    }
}
