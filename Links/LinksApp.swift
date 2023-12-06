//
//  LinksApp.swift
//  Links
//
//  Created by ghulam  on 20/03/2023.
//

import SwiftUI
import FirebaseRemoteConfig

@main
struct LinksApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            DeepLinksView()
        }
    }
}
