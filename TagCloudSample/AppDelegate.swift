//
//  AppDelegate.swift
//  TagCloudSample
//
//  Created by Masato Takamura on 2022/08/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

