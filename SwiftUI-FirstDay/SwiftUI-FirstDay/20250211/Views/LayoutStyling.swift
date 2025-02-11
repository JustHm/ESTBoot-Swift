//
//  LayoutStyling.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/11/25.
//

import SwiftUI

struct LayoutStyling: View {
    var body: some View {
        
        HStack {
            Text("Hello")
            Spacer()
            Text("World")
        }
        .padding()
        VStack(spacing: 10) {
            Text("SwiftUI")
            Text("레이아웃")
        }
        ZStack {
            Text("SwiftUI 연습")
                .foregroundStyle(.white)
        }
        .background(.blue)
    }
}

#Preview {
    LayoutStyling()
}
