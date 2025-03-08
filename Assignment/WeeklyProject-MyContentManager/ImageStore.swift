//
//  ImageStore.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/8/25.
//

import UIKit

struct ImageStore {
    func saveImageToDirectory(identifier: String, image: UIImage) {
        // 저장할 디렉토리 경로 설정 (picturesDirectory, cachesDirectory도 존재함)
        // userDomainMask: 사용자 홈 디렉토리는 사용자 관련 파일이 저장되는 곳
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
        // identifier를 파일(이미지) 이름으로 저장
        let imageName = "\(identifier)"
        // 이미지의 경로 및 확장자 형식 (conformingTo: 확장자)
        let fileURL = documentsDirectory.appendingPathComponent(imageName, conformingTo: .jpeg)
        
        // 폴더 경로 확인
        print(fileURL)
        
        do {
            // 파일로 저장하기 위해 data 타입으로 변환 (JPEG은 압축을 해주므로 크기가 줄어듦 / PNG는 비손실)
            if let imageData = image.jpegData(compressionQuality: 1) {
                // 이미지 데이터를 fileURL의 경로에 저장시킵니다.
                try imageData.write(to: fileURL)
                print("Image saved at: \(fileURL)")
            }
            
        } catch {
            print("Failed to save images: \(error)")
        }
    }
    //
    func loadAllImageFromDirectory() -> [(String, UIImage?)] {
        let fileManager = FileManager.default
        // 파일 경로로 접근
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // 디렉토리 내부의 콘텐츠들에 접근
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
            // 이미지 path만 필터링
            let imageURLs = fileURLs.filter { $0.pathExtension.lowercased() == "jpeg" }
            // 이미지들로 변환
            let images: [(String, UIImage?)] = imageURLs.map { url in
                let imageName = url.lastPathComponent
                let image = UIImage(contentsOfFile: url.path)
                return (imageName, image)
            }
            
            return images
            
        } catch {
            print("Error reading directory \(error)")
        }
        
        return []
    }
    // 이미지 삭제
    func deleteImageFromDirectory(idnetifier: String) {
        let fileManager = FileManager.default
        let documuentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documuentDirectory.appendingPathComponent(idnetifier, conformingTo: .jpeg)
        
        do {
            try fileManager.removeItem(at: fileURL)
            print("Successfully deleted image")
        } catch {
            print("Failed to delete image: \(error)")
        }
    }
}
