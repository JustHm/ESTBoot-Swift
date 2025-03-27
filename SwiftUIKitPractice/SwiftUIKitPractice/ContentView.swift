//
//  ContentView.swift
//  SwiftUIKitPractice
//
//  Created by 안정흠 on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItems: [Any] = []
    @State private var showShareSheet = false

    var body: some View {
        VStack(spacing: 30) {
            Text("SwiftUI와 UIKit 통합 예제")
                .font(.title)
                .padding()

            // 텍스트 공유 버튼
            Button("텍스트 공유하기") {
                selectedItems = ["이 SwiftUI 예제를 확인해 보세요!"]
                showShareSheet = true
            }
            .padding()

            // 이미지 + URL 공유 버튼
            Button("URL & 이미지 공유하기") {
                if let image = UIImage(named: "logo"),
                   let url = URL(string: "https://www.apple.com") {
                    selectedItems = [image, url]
                    showShareSheet = true
                } else {
                    print("공유할 리소스가 없습니다.")
                }
            }
            .padding()
        }
        // 공유 시트 연결
        .sheet(isPresented: $showShareSheet) {
            ActivityView(activityItems: selectedItems)
        }
    }
}

#Preview {
    ContentView()
}
