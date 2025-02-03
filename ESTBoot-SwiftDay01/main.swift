//
//  main.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 1/22/25.
//

import Foundation

main()

func main() {
    let storage = RecordStorage()
    print("""
   === 회고 시스템 ===
   1. 회고 추가
   2. 회고 조회
   3. 회고 수정
   4. 회고 삭제
   5. 전체 회고 목록 출력
   6. 종료
   """)
    while true {
        print("메뉴를 선택하세요: ", terminator: "")
        switch readLine() {
        case "1":
            print("회고를 추가할 날짜를 입력하세요(ex: 2020-01-01):", terminator: " ")
            let date = readLine() ?? ""
            print("회고를 내용 입력하세요:", terminator: " ")
            let content = readLine() ?? ""
            storage.addRecord(date: date, content: content)
        case "2":
            print("회고를 조회할 날짜를 입력하세요(ex: 2020-01-01):", terminator: " ")
            let date = readLine() ?? ""
            storage.printRecord(date: date)
        case "3":
            print("회고를 수정할 날짜를 입력하세요(ex: 2020-01-01):", terminator: " ")
            let date = readLine() ?? ""
            print("회고를 내용 입력하세요:", terminator: " ")
            let content = readLine() ?? ""
            storage.modifyRecord(date: date, content: content)
        case "4":
            print("제거할 회고 날짜를 입력하세요(ex: 2020-01-01):", terminator: " ")
            let date = readLine() ?? ""
            storage.removeRecord(date: date)
        case "5":
            print("날짜별로 회고를 출력합니다. (1 ascending / 2.decending):", terminator: " ")
            let input = readLine() ?? "1"
            storage.printRecordAll(ascending: (input == "1") ? true : false)
        case "6":
            print("프로그램을 종료합니다.")
            return
        default:
            print("잘못된 입력입니다.")
        }
    }
}

class RecordStorage {
    private var dailyRecord: [String: Record] = Dictionary()
    
//    private func isKeyValid(key: String) -> Bool {
//        let temp = key.split(separator: "-").map{Int(String($0))!}
//        key.matches(of: <#T##RegexComponent#>)
//        return (temp.count == 3)
//    }
    
    func addRecord(date key: String, content value: String) {
        guard !dailyRecord.contains(where: { dict in dict.key == key }) else {
            print("회고가 이미 존재합니다.\n")
            return
        }
        dailyRecord[key] = Record(date: key, content: value)
        print("회고가 추가되었습니다.\n")
    }
    func modifyRecord(date key: String, content value: String) {
        guard dailyRecord[key] != nil else {
            print("해당 날짜의 회고가 없습니다.\n")
            return
        }
        dailyRecord[key] = Record(date: key, content: value)
        print("회고가 수정되었습니다.\n")
    }
    func removeRecord(date key: String) {
        (dailyRecord.removeValue(forKey: key) != nil) ? print("회고가 삭제되었습니다.\n") : print("해당 날짜의 회고가 없습니다.\n")
    }
    
    func printRecord(date key: String) {
        guard let record = dailyRecord[key] else {
            print("해당 날짜의 회고가 없습니다.\n")
            return
        }
        print("""
        날짜: \(record.date)
        내용: \(record.content)
        
        """)
    }
    
    func printRecordAll(ascending: Bool) {
        guard !dailyRecord.isEmpty else {
            print("저장된 회고가 없습니다.\n")
            return
        }
        
        print("=== 저장된 회고 목록 ===")
        let list = (ascending ? dailyRecord.sorted(by: {$0.key < $1.key}) : dailyRecord.sorted(by: {$0.key > $1.key}))
            .map{$0.value}
        for item in list {
            print("""
            날짜: \(item.date)
            내용: \(item.content)
            
            """)
        }
    }
}

struct Record {
    let date: String
    var content: String
}
