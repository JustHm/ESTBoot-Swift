//
//  FileManagerHelper.swift
//  SwiftUI-FirstDay
//
//  Created by 안정흠 on 2/13/25.
//

import Foundation

// 사용자 정보를 저장할 데이터 모델 정의 (Codable을 채택해 JSON 인코딩/디코딩 가능)
struct User: Codable {
    var id: UUID  // 고유 식별자
    var name: String  // 사용자 이름
    var age: Int  // 사용자 나이
}

// FileManagerHelper 클래스: 파일 관리와 데이터 저장/불러오기를 처리하는 싱글톤 클래스
// 여기서 로컬파일은 앱 샌드박스 내의 파일임
class FileManagerHelper {
    static let shared = FileManagerHelper()  // 싱글톤 인스턴스 생성
    private let fileName = "users.json"  // 저장할 파일 이름 정의

    // users 배열을 JSON 파일로 저장하는 메서드
    func saveUsers(_ users: [User]) {
        // Document 디렉토리의 경로를 가져옴 (앱 전용 사용자 데이터 저장 경로)
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentDirectory.appendingPathComponent(fileName)  // 파일 경로 생성
        let encoder = JSONEncoder()  // JSON 인코더 생성
        if let data = try? encoder.encode(users) {  // users 배열을 JSON 데이터로 변환
            do {
                try data.write(to: fileURL)  // 데이터를 파일에 저장
                print("데이터 저장 성공: \(fileURL)")  // 저장 성공 메시지 출력
            } catch {
                print("저장 실패: \(error)")  // 저장 실패 시 오류 메시지 출력
            }
        }
    }

    // JSON 파일에서 User 배열을 불러오는 메서드
    func loadUsers() -> [User] {
        // Document 디렉토리의 경로와 저장된 파일의 경로 생성
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentDirectory.appendingPathComponent(fileName)

        if let data = try? Data(contentsOf: fileURL) {  // 파일에서 데이터를 읽어옴
            let decoder = JSONDecoder()  // JSON 디코더 생성
            if let users = try? decoder.decode([User].self, from: data) {  // JSON 데이터를 User 배열로 변환
                print("데이터 불러오기 성공")
                return users  // 변환된 User 배열 반환
            }
        }
        print("데이터 불러오기 실패")
        return []  // 데이터 불러오기 실패 시 빈 배열 반환
    }
}
