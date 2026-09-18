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
    var subtitle: String? = nil
    var isActive: Bool = false
    var progress: CGFloat? = nil
    var action: () -> Void
    
    @State private var isHovered = false
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: hasMultilineContent ? .top : .center, spacing: 10) {
                if let icon {
                    Image(systemName: icon)
                        .font(.system(size: 14, weight: isActive ? .semibold : .regular))
                        .frame(width: 18, alignment: .center)
                        .padding(.top, hasMultilineContent ? 2 : 0)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.body)
                        .fontWeight(isActive ? .semibold : .regular)
                    
                    if let subtitle {
                        Text(subtitle)
                            .font(.caption)
                            .foregroundColor(isHovered ? .white.opacity(0.8) : .secondary)
                    }
                    
                    if let progress, isActive {
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(isHovered ? Color.white.opacity(0.3) : Color.gray.opacity(0.25))
                                    .frame(height: 5)
                                Capsule()
                                    .fill(isHovered ? Color.white : Color.accentColor)
                                    .frame(width: max(0, min(geo.size.width, geo.size.width * progress)), height: 5)
                            }
                        }
                        .frame(height: 5)
                        .padding(.top, 2)
                    }
                }
                
                Spacer()
            }
            // Textfarbe passt sich an: Bei Hover weiß, bei Active Accent-Farbe, sonst Standard
            .foregroundColor(isHovered ? .white : (isActive ? .accentColor : .primary))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            // Die macOS-Auswahlfarbe bei Mouse-Hover
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
    
    private var hasMultilineContent: Bool {
        subtitle != nil || (progress != nil && isActive)
    }
}

#Preview {
    VStack(spacing: 4) {
        MenuRow(icon: "gearshape", title: "Standard Settings") {
            print("Clicked")
        }
        
        MenuRow(icon: "clock.badge.checkmark", title: "Work Time Calculator", subtitle: "06:45 Std. gearbeitet", isActive: true, progress: 0.75) {
            print("Clicked Work Time")
        }
        
        MenuRow(title: "Ohne Icon aktiv", isActive: true) {
            print("Clicked Active")
        }
    }
    .frame(width: 280)
    .padding()
}


