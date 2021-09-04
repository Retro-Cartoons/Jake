//
//  AppDelegate.swift
//  JakeExampleProject
//
//  Created by Ferhan Akkan on 21.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = UINavigationController(rootViewController: HomeVC())
    window?.makeKeyAndVisible()
    return true
  }
}
