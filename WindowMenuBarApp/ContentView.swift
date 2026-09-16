//
//  ContentView.swift
//  WindowMenuBarApp
//
//  Created by Stephan Goergens on 14.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var isMonitoringActive = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // --- SEKTION 2: Datei-Aktionen ---
            VStack(spacing: 2) {
                /*MenuRow(icon: "link.badge.plus", title: "UNC/smb Converter") {
                    print("Dateien auswählen getippt")
                }*/
                UncSmbConverterView()
                Divider()
                MenuRow(icon: "clipboard", title: "Clipboard Manager") {
                    print("Jetzt prüfen getippt")
                }
                MenuRow(icon: "cursorarrow", title: "Mouse") {
                    print("Ordner öffnen getippt")
                }
                MenuRow(icon: "clock.badge.checkmark", title: "Work Time Calculator") {
                    print("Ordner öffnen getippt")
                }
            }
            .padding(.vertical, 6)
            
            Divider()
                .padding(.horizontal, 12)
            
            // --- SEKTION 3: App-Optionen ---
            VStack(spacing: 2) {
                HStack() {
                    MenuRow(icon: "arrow.clockwise", title: "Autostart") {
                        print("Einstellungen geöffnet")
                    }
                    Circle()
                        .fill(isMonitoringActive ? Color.green
                              : Color.gray)
                                .frame(width: 8, height: 8)
                    Spacer()
                }
                MenuRow(icon: "gearshape", title: "Settings") {
                    print("Einstellungen geöffnet")
                }
                MenuRow(icon: "power", title: "Quit") {
                    NSApplication.shared.terminate(nil)
                }
            }
            .padding(.vertical, 6)
        }
        .background(Color(NSColor.windowBackgroundColor)) // Nutzt das native macOS-Panel-Grau
    }
}

#Preview {
    ContentView()
}
