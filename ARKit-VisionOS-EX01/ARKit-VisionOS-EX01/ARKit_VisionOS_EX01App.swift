//
//  ARKit_VisionOS_EX01App.swift
//  ARKit-VisionOS-EX01
//
//  Created by 안정흠 on 4/25/25.
//

import SwiftUI

@main
struct ARKit_VisionOS_EX01App: App {
    var body: some Scene {
        WindowGroup {
//            ContentView() // 얘 windowStyle은 window임
//            ContentView2()
            ContentView3()
        }
        .windowStyle(.volumetric) // 공간형 창 (immersive 아닌 3D 공간형)
        .defaultSize(width: 0.6, height: 0.3, depth: 0.2) // 공간 창 크기
    }
}
