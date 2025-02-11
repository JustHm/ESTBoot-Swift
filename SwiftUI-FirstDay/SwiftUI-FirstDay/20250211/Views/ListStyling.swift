//
//  ListStyling.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/11/25.
//

import SwiftUI

struct ListStyling: View {
    let fruits = ["Apple", "Banana", "Cherry", "Mango"]
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { item in
                Text(item)
            }
        }
    }
}

#Preview {
    ListStyling()
}
