//
//  ARVisionView.swift
//  ARKit-EX01
//
//  Created by 안정흠 on 4/25/25.
//


import SwiftUI
import ARKit
import RealityKit
/// ARViewController의 Wrapper
struct ARVisionView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ARViewController {
        return ARViewController()
    }

    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {}
}
