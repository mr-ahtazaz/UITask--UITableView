//
//  AppDelegate.swift
//  UI-Task-2
//
//  Created by Ahtazaz on 21/10/2020.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeView = HomeRouter.createHomeView()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeView
        window?.makeKeyAndVisible()

        return true
    }


}

