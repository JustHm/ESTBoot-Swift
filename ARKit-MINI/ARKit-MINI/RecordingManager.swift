//
//  RecordingManager.swift
//  ARKit-MINI
//
//  Created by 안정흠 on 4/29/25.
//
import Foundation
import ARKit

class RecordingManager: ObservableObject {
    @Published var isRecording = false {
        didSet {
            if isRecording {
                recordedFrames = []
            } else {
                saveRecording()
            }
        }
    }
    public var recordGallery: [[BodyFrame]] = [[]]
    private var recordedFrames: [BodyFrame] = []
    
    func record(timestamp: TimeInterval, rootTransform: simd_float4x4, jointTransforms: [simd_float4x4]) {
        guard isRecording else { return }
        
        let bodyFrame = BodyFrame(timestamp: timestamp, rootTransform: rootTransform, jointTransforms: jointTransforms)
        recordedFrames.append(bodyFrame)
    }
    
    private func saveRecording() {
        if recordedFrames.isEmpty { return }
        recordGallery.append(recordedFrames)
    }
    
    func loadRecording(from url: URL) -> [[BodyFrame]] {
        return recordGallery
    }
}
