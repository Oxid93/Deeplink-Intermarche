//
//  AppleDelegate.swift
//  Links
//
//  Created by ghulam  on 11/05/2023.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseRemoteConfig
import WebKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
