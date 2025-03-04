//
//  ImageViewStyling.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/11/25.
//

import SwiftUI

struct ImageViewStyling: View {
    var body: some View {
        Image("IMG_7406")
            .resizable()
            .scaledToFit()
            .background(.gray)
            .clipShape(Circle())
    }
}

#Preview {
    ImageViewStyling()
}
