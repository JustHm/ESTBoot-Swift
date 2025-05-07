//
//  SimplePlaybackView.swift
//  ARKit-MINI
//
//  Created by 안정흠 on 4/29/25.
//


import SwiftUI
import RealityKit
import ARKit

struct SimplePlaybackView: View {
    let frames: [BodyFrame]
    @State private var modelEntity: BodyTrackedEntity?
    @State private var playbackAnchor: AnchorEntity?
    @State private var currentFrameIndex = 0
    @State private var timer: Timer?
    
    var body: some View {
        RealityView { content in
            Task { [content] in
                do {
                    // 로봇 모델 로드
                    let bodyTrackedModel = try await BodyTrackedEntity(named: "robot")
                    bodyTrackedModel.scale = .init(x: 0.5, y: 0.5, z: 0.5)
                    
                    // 앵커 생성 및 씬에 추가
                    let anchor = AnchorEntity()
                    anchor.addChild(bodyTrackedModel)
                    content.add(anchor)
                    playbackAnchor = anchor
                    modelEntity = bodyTrackedModel
                    
                    // 시작
                    startPlayback()
                } catch {
                    print("Failed to load model:", error)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private func startPlayback() {
        // 30fps 로 타이머 실행
        timer = Timer.scheduledTimer(withTimeInterval: 1.0/30.0, repeats: true) { _ in
            updateModel()
        }
    }
    
    private func updateModel() {
        guard currentFrameIndex < frames.count,
              let model = modelEntity,
              let anchor = playbackAnchor else {
            timer?.invalidate()
            return
        }

        let frame = frames[currentFrameIndex]

        // 위치 및 회전 적용
//        anchor.transform.matrix = frame.rootTransform
        // 위치 고정, 회전만 적용
        let worldRotation = Transform(matrix: frame.rootTransform).rotation
        anchor.orientation = worldRotation
        
        // 관절(스켈레톤) 애니메이션 업데이트
        
//        for (arkitJointIndex, arkitName) in ARSkeletonDefinition.defaultBody3D.jointNames.enumerated() {
//          guard let modelJointName = yourNameMap[arkitName],
//                let jointEntity = model.findEntity(named: modelJointName) else { continue }
//          jointEntity.transform.matrix = frame.jointTransforms[arkitJointIndex]
//        }
        
//        for (index, jointTransform) in frame.jointTransforms.enumerated() {
//            let jointName = ARSkeletonDefinition.defaultBody3D.jointNames[index]
//            if let jointEntity = model.findEntity(named: jointName) {
//                jointEntity.transform.matrix = jointTransform
//            }
//        }

        currentFrameIndex += 1
    }
}

//#Preview {
//    //    SimplePlaybackView(frames: , modelEntity: , currentFrameIndex: , timer: )
//}
