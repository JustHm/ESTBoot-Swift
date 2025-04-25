//
//  VisionImagePicker.swift
//  ARKit-VisionOS-EX01
//
//  Created by 안정흠 on 4/25/25.
//


import SwiftUI           // UIViewControllerRepresentable, @Binding, View 관련
import UIKit             // UIImage, UIImagePickerController, UINavigationControllerDelegate 등


struct VisionImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: VisionImagePicker
        init(_ parent: VisionImagePicker) { self.parent = parent }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
    }
}