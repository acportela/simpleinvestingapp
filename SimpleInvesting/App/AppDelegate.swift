//
//  AppDelegate.swift
//  SimpleInvesting
//
//  Created by Antonio Rodrigues on 18/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootController = UINavigationController()
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
        self.appCoordinator = AppCoordinator(rootViewController: rootController)
        self.appCoordinator?.start()
        
        return true
    }

}
