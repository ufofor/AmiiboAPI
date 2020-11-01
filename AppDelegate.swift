//
//  AppDelegate.swift
//  CollectionViewAPI
//
//  Created by Sean Kang on 2020/10/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AmiiboListVC()
        window?.makeKeyAndVisible()
        return true
    }

   

}

