//
//  AppDelegate.swift
//  SravniRu
//
//  Created by Marcus on 29.11.2021.
//

import UIKit
@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = Assembly.build()
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

