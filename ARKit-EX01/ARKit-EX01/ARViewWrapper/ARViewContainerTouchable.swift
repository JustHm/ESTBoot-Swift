//
//  ARViewContainerTouchable.swift
//  ARKit-EX01
//
//  Created by 안정흠 on 4/25/25.
//


import SwiftUI
import RealityKit
import ARKit
/// RealityKit의 ARView를 사용함 터치 가능
///수평면 탐지후 좌표계 그림
struct ARViewContainerTouchable: UIViewRepresentable {
    @ObservedObject var viewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        viewModel.arView = arView
        // AR 세션 구성
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // 수평면 탐지 활성화
        arView.session.run(config) // 실행

        // 디버그 정보 표시 (선택 사항)
        // showFeaturePoints - 감지되는 실객체의 feature points(점)가 보여짐 (TrueDepth로 인식한)
        // showWorldOrigin - 핸드폰 위치 기준으로 월드좌표계가 보임
        arView.debugOptions = [.showFeaturePoints, .showWorldOrigin]
        // TapGesture 이벤트 설정
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
    
    class Coordinator: NSObject {
        var viewModel: ARViewModel
        
        init(viewModel: ARViewModel) {
            self.viewModel = viewModel
        }
        
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = viewModel.arView else { return }
            let location = sender.location(in: arView)
            // TapGesture로 선택된 좌표를 반환해 박스 생성
            // raycast - 선택한 곳의 레이저를 쏴서 plane에 부딫히는 위치를 반환하는 느낌..
            if let result = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal).first {
                let position = SIMD3<Float>( // 반환된 좌표값 SIMD3로 변환
                    result.worldTransform.columns.3.x,
                    result.worldTransform.columns.3.y,
                    result.worldTransform.columns.3.z
                )
                viewModel.placeBox(at: position) // 박스배치
            }
        }
    }
}
