//
//  ARViewContainer.swift
//  ARKit-MINI
//
//  Created by 안정흠 on 4/29/25.
//

import SwiftUI
import RealityKit
import ARKit
import Combine


struct ARBodyTrackingView: UIViewRepresentable {
    @ObservedObject var recordingManager: RecordingManager
    
    func makeCoordinator() -> Coordinator {
        Coordinator(recordingManager: recordingManager)
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.session.delegate = context.coordinator
        
        guard ARBodyTrackingConfiguration.isSupported else {
            fatalError("Body tracking is not supported on this device.")
        }
        
        let configuration = ARBodyTrackingConfiguration()
        arView.session.run(configuration)
        
        context.coordinator.characterAnchor = AnchorEntity()
        arView.scene.addAnchor(context.coordinator.characterAnchor!)
        
        var cancellable: AnyCancellable? = nil
        cancellable = Entity.loadBodyTrackedAsync(named: "robot")
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error loading model: \(error.localizedDescription)")
                }
                cancellable?.cancel()
            }, receiveValue: { entity in
                if let bodyTrackedEntity = entity as? BodyTrackedEntity {
                    bodyTrackedEntity.scale = [1.0, 1.0, 1.0]
                    context.coordinator.character = bodyTrackedEntity
                } else {
                    print("Error: Loaded entity is not a BodyTrackedEntity")
                }
                cancellable?.cancel()
            })
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) { }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var recordingManager: RecordingManager
        var character: BodyTrackedEntity?
        var characterAnchor: AnchorEntity?
        let characterOffset: SIMD3<Float> = [0.4, 0, 0]
        
        init(recordingManager: RecordingManager) {
            self.recordingManager = recordingManager
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            for anchor in anchors {
                guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }
                
                let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
                characterAnchor?.position = bodyPosition + characterOffset
                characterAnchor?.orientation = Transform(matrix: bodyAnchor.transform).rotation
                
                if let character = character, character.parent == nil {
                    characterAnchor?.addChild(character)
                }
                
                // 👇 추가: 녹화가 켜져있으면 현재 프레임 저장
                let worldT = bodyAnchor.transform
                let joints = bodyAnchor.skeleton.jointModelTransforms
                recordingManager.record(timestamp: Date().timeIntervalSince1970,
                                        rootTransform: worldT,
                                        jointTransforms: joints)
            }
        }
    }
}
