//
//  PickerExample.swift
//  JSONDecodeTest
//
//  Created by 안정흠 on 2/13/25.
//

import SwiftUI

struct PickerExample: View {
    @State private var selected = "Red"
    private var colors = ["Red", "Green", "Blue"]
    var body: some View {
        VStack {
            Text("Color Picker: \(selected)")
            Picker("Pick Color", selection: $selected) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    PickerExample()
}
