//
//  WindowMenuBarAppApp.swift
//  WindowMenuBarApp
//
//  Created by Stephan Goergens on 14.09.26.
//

import SwiftUI

@main
struct WindowMenuBarAppApp: App {
    var body: some Scene {
        MenuBarExtra {
            ContentView()
                //.frame(width: 300, height: 500)
        } label: {
            Label("Window Menue Bar App", systemImage: "externaldrive.trianglebadge.exclamationmark")
        }
        .menuBarExtraStyle(.window)
    }
}

