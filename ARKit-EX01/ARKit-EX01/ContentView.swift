//
//  ContentView.swift
//  ARKit-EX01
//
//  Created by 안정흠 on 4/25/25.
//

import SwiftUI

// SwiftUI 화면에 ARKit 뷰 연결
struct ContentView: View {
    var body: some View {
        VStack {
            Text("AR + VisionOS Demo")
                .font(.headline)
                .padding()

//            ARVisionView()
//                .edgesIgnoringSafeArea(.all)
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
