//
//  ARViewContainer.swift
//  ARKit-EX01
//
//  Created by 안정흠 on 4/25/25.
//


import SwiftUI
import RealityKit
import ARKit
/// RealityKit의 ARView를 사용함
///수평면 탐지후 좌표계 그림
struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // 수평면 탐지 활성화
        arView.session.run(config)

        // 디버그 정보 표시 (선택 사항)
        arView.debugOptions = [.showFeaturePoints, .showWorldOrigin]

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
