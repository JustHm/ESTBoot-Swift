//
//  TextViewStyling.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/11/25.
//

import SwiftUI

struct TextViewStyling: View {
    var body: some View {
        Text("SwiftUI 실습")
            .font(.largeTitle)
            .foregroundStyle(.red)
            .padding()
            .background(.yellow)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue, lineWidth: 2)
            }
//                .padding()
    }
}

#Preview {
    TextViewStyling()
}
