//
//  ARViewModel.swift
//  ARKit-EX01
//
//  Created by 안정흠 on 4/25/25.
//

import Foundation
import RealityKit

class ARViewModel: ObservableObject {
    var arView: ARView?
    /// 박스 배치 함수
    /// SIMD3 - Vector 3 scalar (3차원 좌표 표현용)
    func placeBox(at location: SIMD3<Float>) {
        guard let arView else { return }
        let box = ModelEntity(mesh: .generateBox(size: 0.1),
                              materials: [
                                SimpleMaterial(color: .green, isMetallic: true)
                              ]
        )
        
        let anchor = AnchorEntity(world: location)
        anchor.addChild(box)
        arView.scene.addAnchor(anchor)
    }
    
    /// 박스 회전 함수
    func rotateBox() {
        guard let arView else { return }
        guard let entity = arView.scene.anchors.first?.children.first else { return }
        // simd_quatf - 새로운 회전을 생성하는 쿼터니언 Y축 기준으로 45도 회전
        // 4차원 벡터값을 변형하는것
        entity.transform.rotation *= simd_quatf(angle: .pi / 4, axis: [0, 1, 0])
    }
}
