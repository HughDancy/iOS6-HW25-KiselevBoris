//
//  AppDelegate.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 03.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let startViewController = ViewController()
        let startNavigationViewController = UINavigationController(rootViewController: startViewController)
        
        window?.rootViewController = startNavigationViewController
        window?.makeKeyAndVisible()
        return true
    }
    
}
