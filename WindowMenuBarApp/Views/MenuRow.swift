//
//  MenuRow.swift
//  WindowMenuBarApp
//
//  Created by Stephan Goergens on 14.09.26.
//

import SwiftUI

struct MenuRow: View {
    var icon: String? = nil
    let title: String
    var action: () -> Void
    
    @State private var isHovered = false
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                if let icon {
                    Image(systemName: icon)
                        .font(.system(size: 14))
                        .frame(width: 18, alignment: .center)
                }
                
                Text(title)
                    .font(.body)
                
                Spacer()
            }
            // Textfarbe passt sich an, wenn Zeile blau markiert wird (Hover)
            .foregroundColor(isHovered ? .white : .primary)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            // Die typische macOS-Auswahlfarbe bei Mouse-Hover
            .background(isHovered ? Color.accentColor : Color.clear)
            .contentShape(Rectangle()) // Macht die gesamte Zeile klickbar
            .cornerRadius(4)
        }
        .buttonStyle(.plain) // Entfernt das standardmäßige Button-Design
        .padding(.horizontal, 6)
        .onHover { hovering in
            isHovered = hovering
        }
    }
}

#Preview {
    MenuRow(icon: "gearshape", title: "Settings") {
        print("Clicked")
    }
}

