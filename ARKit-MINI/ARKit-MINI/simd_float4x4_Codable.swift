//
//  simd_float4x4_Codable.swift
//  ARKit-MINI
//
//  Created by 안정흠 on 4/29/25.
//

import Foundation
import RealityKit

// Swift의 simd_float4x4를 Codable로 감싸는 래퍼
struct simd_float4x4_Codable: Codable {
    var matrix: [[Float]]
    
    init(_ transform: simd_float4x4) {
        matrix = (0..<4).map { i in
            (0..<4).map { j in
                transform[i][j]
            }
        }
    }
}
extension simd_float4x4_Codable {
    func toSimd() -> simd_float4x4 {
        var matrix = simd_float4x4()
        for i in 0..<4 {
            for j in 0..<4 {
                matrix[i][j] = self.matrix[i][j]
            }
        }
        return matrix
    }
}
