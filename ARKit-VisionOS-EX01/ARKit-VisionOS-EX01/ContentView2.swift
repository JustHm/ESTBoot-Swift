//
//  ContentView2.swift
//  ARKit-VisionOS-EX01
//
//  Created by 안정흠 on 4/25/25.
//
import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView2: View {
    @State private var message = "Hello, VisionOS!"

    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.largeTitle)
                .bold()
            Button("Tap to Change") {
                message = "You tapped VisionOS!"
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .padding()
        .glassBackgroundEffect(in: .rect(cornerRadius: 15)) // visionOS 스타일
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView2()
}
