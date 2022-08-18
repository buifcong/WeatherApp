//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by bùi thành công on 06/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        nav.viewControllers = [WeatherViewController()]
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

}

