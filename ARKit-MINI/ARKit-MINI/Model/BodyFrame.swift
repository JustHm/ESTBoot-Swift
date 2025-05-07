//
//  BodyFrame.swift
//  ARKit-MINI
//
//  Created by 안정흠 on 4/29/25.
//


import Foundation
import simd

struct BodyFrame {
  let timestamp: TimeInterval
  let rootTransform: simd_float4x4         // 월드 트랜스폼
  let jointTransforms: [simd_float4x4]      // 관절별 로컬 매트릭스
}
