//
//  AppDelegate.swift
//  PositioningLabel
//
//  Created by I L H A N on 6.04.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let navigatorController = UINavigationController(rootViewController: PositioningLabel())
        window?.rootViewController = navigatorController
        
        return true
    }

}


