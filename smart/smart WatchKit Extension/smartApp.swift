//
//  smartApp.swift
//  smart WatchKit Extension
//
//  Created by bnkwsr2 on 13.12.2021.
//

import SwiftUI

@main
struct smartApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
                ContentView()
        }
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
