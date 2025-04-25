//
//  ContentView.swift
//  ARKit-EX01
//
//  Created by 안정흠 on 4/25/25.
//

import SwiftUI

// SwiftUI 화면에 ARKit 뷰 연결
struct ContentView: View {
    @StateObject var viewModel = ARViewModel()
    
    var body: some View {
        ZStack {
            ARViewContainerTouchable(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Button("Rotate Box") { viewModel.rotateBox() }
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10) // will deprecate
                }
            }
        }
//        VStack {
//            Text("AR + VisionOS Demo")
//                .font(.headline)
//                .padding()
//
////            ARVisionView()
////                .edgesIgnoringSafeArea(.all)
//            ARViewContainer()
//                .edgesIgnoringSafeArea(.all)
//        }
    }
}

#Preview {
    ContentView()
}
