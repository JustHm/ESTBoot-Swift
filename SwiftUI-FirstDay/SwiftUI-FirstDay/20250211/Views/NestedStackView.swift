//
//  NestedStackView.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/11/25.
//

import SwiftUI

struct NestedStackView: View {
    var body: some View {
        VStack {
            HStack {
                Text("이름:")
                Text("안정흠")
            }
            ZStack {
                Color.gray
                Text("중첩된 ZStack")
                    .foregroundStyle(.white)
            }
            .frame(height: 100)
        }
        
    }
}

#Preview {
    NestedStackView()
}
