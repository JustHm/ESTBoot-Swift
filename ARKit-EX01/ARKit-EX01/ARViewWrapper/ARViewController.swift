//
//  ARViewController.swift
//  ARKit-EX01
//
//  Created by 안정흠 on 4/25/25.
//

import UIKit
import ARKit
import RealityKit
/// RealityKit의 ARView를 사용까진 동일,대신 UIKit으로 그리고 SwiftUI로 변환해서 보여줌
/// 박스 배치
class ARViewController: UIViewController {
    let arView = ARView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        // ARView를 화면에 추가
        view.addSubview(arView)
        arView.frame = view.bounds

        // AR 세션 설정
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // 바닥 인식
        arView.session.run(config)

        // 바닥에 박스 모델 배치
        let anchor = AnchorEntity(plane: .horizontal) // 바닥 감지 anchor
        let box = ModelEntity(mesh: .generateBox(size: 0.1), // 10cm 박스
                              materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        anchor.addChild(box)
        arView.scene.anchors.append(anchor)
    }
}
