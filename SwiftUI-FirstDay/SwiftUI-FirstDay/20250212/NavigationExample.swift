//
//  NavigationExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("메인화면")
                NavigationLink("세부화면으로 이동") {
                    DetailViewExample()
                }
            }
            .navigationTitle("메인화면")
        }
    }
}

struct DetailViewExample: View {
    var body: some View {
        VStack {
            Text("여기는 세부화면입니다.")
        }
    }
}

#Preview {
    NavigationExample()
}
