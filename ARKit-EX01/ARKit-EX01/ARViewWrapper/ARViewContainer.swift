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
        // AR 세션 구성
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // 수평면 탐지 활성화
        arView.session.run(config) // 실행

        // 디버그 정보 표시 (선택 사항)
        // showFeaturePoints - 감지되는 실객체의 feature points(점)가 보여짐 (TrueDepth로 인식한)
        // showWorldOrigin - 핸드폰 위치 기준으로 월드좌표계가 보임
        arView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        
        // 3D 객체 생성 및 배치 (배치할 plane 설정)
        let anchor = AnchorEntity(plane: .horizontal) // 수직, 수평, any 가 있음
        let box = ModelEntity(mesh: .generateBox(size: 0.1), // 박스 생성
                              materials: [ // 3D객체의 머테리얼 설정
                                SimpleMaterial(color: .green, isMetallic: false)
                              ]
        )
        anchor.addChild(box)
        
        arView.scene.anchors.append(anchor)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
