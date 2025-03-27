//
//  ShareSheetView.swift
//  SwiftUIKitPractice
//
//  Created by 안정흠 on 3/27/25.
//


import SwiftUI

struct ShareSheetView: View {
    @State private var showShareSheet = false

    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI와 UIKit 통합 예제")
                .font(.title)
                .padding()

            Button("텍스트 공유하기") {
                showShareSheet = true
            }
            .padding()
        }
        // sheet를 통해 ActivityView를 모달로 표시
        .sheet(isPresented: $showShareSheet) {
            // 공유할 텍스트 지정
            ActivityView(activityItems: ["이 SwiftUI 예제를 확인해 보세요!"])
        }
    }
}

#Preview {
//    ShareSheetView(showShareSheet: )
}
