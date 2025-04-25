//
//  ContentView3.swift
//  ARKit-VisionOS-EX01
//
//  Created by 안정흠 on 4/25/25.
//


import SwiftUI
import RealityKit
import RealityKitContent
import AVFoundation

struct ContentView3: View {
    @State private var message = "VisionOS에 오신 것을 환영합니다!"
    @State private var modelRotation: Float = 0
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack(spacing: 20) {
            RealityView { content in
                // RealityKit의 3D 모델 불러오기
                if let entity = try? await Entity(named: "toy_biplane", in: realityKitContentBundle) {
                    entity.scale = [0.03, 0.03, 0.03]
                    entity.position = [0, 0, 0]
                    content.add(entity)
                }
            } update: { content in
                // 손 제스처 기반 회전 (터치 대신 hover 시 시뮬레이션 가능)
                if let entity = content.entities.first {
                    entity.transform.rotation *= simd_quatf(angle: 0.01, axis: [0, 1, 0])
                }
            }
            .gesture(
                TapGesture().onEnded {
                    message = "비행기를 클릭했어요!"
                    speak(message)
                }
            )
            .frame(height: 200)

            Text(message)
                .font(.title2)
                .padding()
                .glassBackgroundEffect(in: .rect(cornerRadius: 15))

            Button("음성으로 인사하기") {
                message = "안녕하세요! 이 앱은 VisionOS에서 작동 중입니다."
                speak(message)
            }
            .padding()
            .background(.indigo)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .padding()
    }

    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(utterance)
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView3()
}
