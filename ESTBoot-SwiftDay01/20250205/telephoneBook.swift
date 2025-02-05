//
//  telephoneBook.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/5/25.
//

import Foundation

struct telephoneBook {
    var phoneBooks = [String: String]()
    mutating func input() {
        print("----- 입력기능 -----")
        print("Name: ", terminator: "")
        let name = readLine() ?? "NONE"
        print("phone number: ", terminator: "")
        let phone = readLine() ?? "NONE"
        
        phoneBooks[name] = phone
    }
    func output() {
        print("----- 목록출력 -----")
        phoneBooks.forEach { item in
            print("이름: \(item.key)   전화번호: \(item.value)")
        }
    }
    func search() {
        print("----- 검색 -----")
        print("이름을 입력하세요: ", terminator: "")
        let name = readLine() ?? "NONE"
        if let item = phoneBooks[name] {
            print("이름: \(name)   전화번호: \(item)")
        }
        else {
            print("존재하지 않습니다.")
        }
    }
    mutating func edit() {
        print("----- 수정 -----")
        print("수정할 전화번호의 이름을 입력하세요")
        print("Name: ", terminator: "")
        let key = readLine() ?? "NONE"
        if let item = phoneBooks[key] {
            print("이름: \(key)   전화번호: \(item)")
        }
        
        print("수정할 내용을 입력하세요 (미입력시 기존유지")
        print("phone number: ", terminator: "")
        let phone = readLine()
        
        if let phone {
            phoneBooks[key] = phone
        }
        print("수정 완료")
        if let item = phoneBooks[key] {
            print("이름: \(key)   전화번호: \(item)")
        }
    }
    mutating func delete() {
        print("----- 삭제 -----")
        print("Name: ", terminator: "")
        let name = readLine() ?? "NONE"
        
        phoneBooks.removeValue(forKey: name)
        print("삭제되었습니다.")
    }
}

class PhoneBook {
    var book = telephoneBook()
    
    func main() {
        print(":::: 전화번호부 ::::")
        var book = telephoneBook()
        while true {
            print("""
            ----- Menu -----
            1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)END
            Choice: 
            """, terminator: "")
            switch Int(readLine() ?? "0") {
            case 1:
                book.input()
            case 2:
                book.output()
            case 3:
                book.search()
            case 4:
                book.edit()
            case 5:
                book.delete()
            case 6:
                print("종료합니다.")
                exit(0)
            default:
                print("잘못된 입력입니다.")
            }
        }

    }
}
