//
//  UncSmbConverterView.swift
//  WindowMenuBarApp
//
//  Created by Stephan Goergens on 14.09.26.
//

import SwiftUI

struct UncSmbConverterView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            MenuRow(icon: "link.badge.plus", title: "UNC/smb Converter") {
                print("UNC/smb Converter")
            }
            MenuRow(title: "Erkannt:") {}
            MenuRow(title: "Konvertiert:") {}
            MenuRow(title: "Kein gültiger Pfad erkannt") {}
            MenuRow(title:"Im Finder öffnen") {
            
            }
            MenuRow(title: "Konvertierten Pfad kopieren") {

            }
            
        }
    }
}

#Preview {
    UncSmbConverterView()
}
