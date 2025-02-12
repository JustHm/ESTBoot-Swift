//
//  BindingExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct BindingExample: View {
    @State private var isOn = false
    var body: some View {
        VStack {
            ToggleView(isOn: $isOn)
            Button("Switch") {
                isOn.toggle()
            }
            Text("isOn \(isOn)")
        }
        
    }
}
struct ToggleView: View {
    @Binding var isOn: Bool
    var body: some View {
        VStack {
            Toggle("HELLO", isOn: $isOn)
            Text("isOn \(isOn)")
        }
        .padding()
    }
}

#Preview {
    BindingExample()
}
