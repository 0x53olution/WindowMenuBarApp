//
//  WorkTimeCalcView.swift
//  WindowMenuBarApp
//
//  Created by Stephan Goergens on 18.09.26.
//
import SwiftUI

struct WorkTimeCalcView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            MenuRow(icon: "clock.badge.checkmark", title: "Work Time Calculator", subtitle: "06:45 Std. gearbeitet", isActive: true, progress: 0.75) {
                print("Clicked Work Time")
            }
            
        }
    }
}

#Preview {
    WorkTimeCalcView()
}
