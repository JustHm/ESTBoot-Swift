//
//  AlertExampleView.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct AlertExampleView: View {
    @State private var showAlert = false
    @State private var showActionSheet = false
    var body: some View {
        VStack {
            Button("Show Alert") {
                showAlert = true
            }
            .alert("Title", isPresented: $showAlert) {
                Button("Cancel", role: .destructive) {}
                Button("OK", role: .cancel) {}
            }
            
            Button("Show Action Sheet") {
                showActionSheet = true
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("Select Option"),
                    buttons: [
                        .default(Text("Option 1")),
                        .destructive(Text("Delete")),
                        .cancel()
                    ]
                )
            }
        }
        .padding()
    }
}

#Preview {
    AlertExampleView()
}

