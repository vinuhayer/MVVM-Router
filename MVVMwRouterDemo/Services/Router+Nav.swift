//
//  Router+Nav.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Router + Basic Navigations
extension Router {
    
    /// Go To First Screen
    func goToFirstScreen() {
        
        AppDelegate.shared.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ProductVC.init(nibName: "ProductVC", bundle: nil)
        
        self.mainNav.viewControllers.removeAll()
        self.mainNav.viewControllers.insert(vc, at: 0)
        
        UIView.transition(with: AppDelegate.shared.window!, duration: 0.33, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            
            AppDelegate.shared.window?.rootViewController = self.mainNav
        }, completion: { (finished) in
            
            AppDelegate.shared.window?.becomeKey()
            AppDelegate.shared.window?.makeKeyAndVisible()
            UIApplication.shared.registerForRemoteNotifications()
        })
    }
}
