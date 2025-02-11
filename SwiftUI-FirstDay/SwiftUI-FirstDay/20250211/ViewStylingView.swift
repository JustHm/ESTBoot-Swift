//
//  ViewStylingView.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/11/25.
//

import SwiftUI

struct ViewStylingView: View {
    var body: some View {
        VStack {
            //MARK: 실습 1
            TextViewStyling()
            //MARK: 실습 2
            ImageViewStyling()
            //MARK: 실습 3
            LayoutStyling()
            //MARK: 실습 4
            ListStyling()
            //MARK: 실습 5
            NestedStackView()
        }
        .padding()
    }
}

#Preview {
    ViewStylingView()
}
