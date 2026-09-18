//
//  TaskRow.swift
//  WindowMenuBarApp
//
//  Created by Stephan Goergens on 18.09.26.
//
import SwiftUI

struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var status: String
    var isCompleted: Bool = false
    var isActive: Bool = false
    var progress: CGFloat? = nil
}

struct TaskRow: View {
    @Binding var task: TaskItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Status-Icon / Checkbox
            Button(action: {
                if !task.isActive {
                    task.isCompleted.toggle()
                }
            }) {
                if task.isCompleted {
                    Image(systemName: "checkmark.square")
                        .foregroundColor(.gray)
                } else if task.isActive {
                    Image(systemName: "power")
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .bold))
                } else {
                    Image(systemName: "square")
                        .foregroundColor(.primary)
                }
            }
            .buttonStyle(.plain)
            .padding(.top, 2)
            
            // Text und Fortschrittsbalken
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.body)
                    .foregroundColor(task.isActive ? .blue : (task.isCompleted ? .gray : .primary))
                    .fontWeight(task.isActive ? .medium : .regular)
                
                if let progress = task.progress, task.isActive {
                    // Fortschrittsbalken für das aktive Meeting
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 6)
                            Capsule()
                                .fill(Color.blue)
                                .frame(width: geo.size.width * progress, height: 6)
                        }
                    }
                    .frame(height: 6)
                } else {
                    Text(task.status)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    TaskRow(task: .constant(TaskItem(
        title: "Sprint Planning",
        status: "Läuft gerade",
        isCompleted: false,
        isActive: true,
        progress: 0.6
    )))
}


