//
//  IBanSaverApp_CollaborationApp.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 11.01.24.
//

import SwiftUI
import FirebaseCore

@main
struct IBanSaverApp_CollaborationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoginView()
            }
            .environmentObject(PersonDataSource())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
