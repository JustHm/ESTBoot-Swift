//
//  ViewBuilderExample.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/12/25.
//

import SwiftUI

struct ViewBuilderExample: View {
    @ViewBuilder // ViewBuilder를 안붙여주면 다중 불가
    func createContentView(_ isTitleHidden: Bool) -> some View {
        if !isTitleHidden {
            Text("TITLE").font(.largeTitle)
        }
        Image(systemName: "house")
        Text("MY HOUSE")
    }
    //그룹해서 보내줄수는 있긴 함
    func testGroupedView() -> some View {
        VStack(spacing: 16) {
            Image(systemName: "house")
            Text("MY HOUSE")
        }
    }
    var body: some View {
        VStack {
            createContentView(false)
            testGroupedView()
        }
    }
}

#Preview {
    ViewBuilderExample()
}
