//
//  ContentView.swift
//  ARKit-VisionOS-EX01
//
//  Created by 안정흠 on 4/25/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false

    var body: some View {
        VStack(spacing: 20) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)

                Button("텍스트 인식") {
                    VisionManager.recognizeText(from: image)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }

            Button("사진 선택") {
                showImagePicker = true
            }
        }
        .sheet(isPresented: $showImagePicker) {
            VisionImagePicker(image: $selectedImage)
        }
        .padding()
    }
}


#Preview(windowStyle: .automatic) {
    ContentView()
}
