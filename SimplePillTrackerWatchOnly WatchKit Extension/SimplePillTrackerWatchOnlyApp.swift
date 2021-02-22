//
//  SimplePillTrackerWatchOnlyApp.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 11/2/21.
//

import SwiftUI

@main
struct SimplePillTrackerWatchOnlyApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }
        .onChange(of: scenePhase) { newScenePhase in
              switch newScenePhase {
              case .active:
                print("App is active")
              case .inactive:
                print("App is inactive")
              case .background:
                print("App is in background")
              @unknown default:
                print("Oh - interesting: I received an unexpected new value.")
              }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
