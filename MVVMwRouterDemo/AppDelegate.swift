//
//  AppDelegate.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 28/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var shared: AppDelegate { return UIApplication.shared.delegate as! AppDelegate }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Router.shared.goToFirstScreen()
        return true
    }

}

