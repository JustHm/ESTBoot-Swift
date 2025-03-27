//
//  ReportShareView.swift
//  SwiftUIKitPractice
//
//  Created by 안정흠 on 3/27/25.
//



import SwiftUI

struct ReportShareView: View {
    @State private var showShare = false
    @State private var sharedImage: UIImage?

    var body: some View {
        VStack(spacing: 30) {
            ReportView()
                .frame(width: 300, height: 400)

            Button("리포트 공유하기") {
                // 명시적 사이즈 전달
                let image = ReportView().snapshot(size: CGSize(width: 300, height: 400))
                if image.size.width > 0 {
                    sharedImage = image
                }
                showShare = true
            }
            .padding()
        }
        .sheet(isPresented: $showShare) {
            if let image = sharedImage {
                ActivityView(activityItems: [image])
            } else {
                ActivityView(activityItems: ["⚠️ 스냅샷 이미지 생성 실패"])
            }
        }
        .padding()
    }
}
