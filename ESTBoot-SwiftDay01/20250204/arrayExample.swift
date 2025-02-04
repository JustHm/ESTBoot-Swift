//
//  arrayExample.swift
//  ESTBoot-SwiftDay01
//
//  Created by BEOMJOON KIM on 2025.02.03.
//  Created by 안정흠 on 2/4/25.
//

import Foundation

struct ArrEx {
    func run() {
        arrayLiteralTest()
    }
    
    func arrayLiteralTest() {
        // 배열 선언 및 초기화.
        // 1) 빈 배열 생성 - String 타입의 빈 배열을 생성합니다.
        var emptyArray: [String] = []
        var emptyArray2 = [String]() // 타입 추론 사용
        // 2) 기본 값을 가진 배열 생성
        // ""(빈 문자열)을 5개 가진 배열을 생성합니다.
        var arr2: [String] = Array(repeating: "", count: 5)
        // ["", "", "", "", ""]
        
        // 3) 배열 리터럴을 사용한 초기화
        var fruits: [String] = ["Apple", "Banana", "Cherry"]
        print(emptyArray)
        print(emptyArray2)
        print(arr2)
        print(fruits)
    }
    
    func addAndModifyArrayElements() {
        // 1) append()를 사용하여 요소 추가
        var numbers = [1, 2, 3]
        numbers.append(4) // 배열 끝에 4를 추가
        print(numbers) // [1, 2, 3, 4]
        // 2) append(contentsOf:)를 사용하여 여러 요소 추가
        var arr2: [String] = Array(repeating: "", count: 5)
        // 기존 배열 뒤에 ["Swift", "Codable"]을 추가합니다.
        arr2.append(contentsOf: ["Swift", "Codable"])
        // ["", "", "", "", "", "Swift", "Codable"]
        print(arr2)
        
        // 3) 특정 인덱스에 값 추가
        var arr3: [String] = Array(repeating: "", count: 5)
        arr3[0] = "Hello"
        arr3[1] = "World"
        arr3.append(contentsOf: ["Swift", "Codable"])
        // ["Hello", "World", "", "", "", "Swift", "Codable"]
        print(arr3)
    }
    
    func deleteArrayElement() {
        // 1) 특정 인덱스의 요소 삭제
        var arr = ["Apple", "Banana", "Cherry"]
        arr.remove(at: 1) // 인덱스 1("Banana") 삭제
        print(arr) // ["Apple", "Cherry"]
        
        // 2) 배열의 마지막 요소 삭제
        arr.removeLast()
        print(arr) // ["Apple"]
        
        // 3) 배열 전체 요소 삭제
        arr.removeAll()
        print(arr) // []
    }
    
    func howToAccessArrayElements () {
        // 1) 특정 인덱스의 값 가져오기
        let names = ["Alice", "Bob", "Charlie"]
        print(names[0]) // Alice
        print(names[1]) // Bob
        // 2) 배열의 모든 요소 순회하기
        for name in names {
            print(name)
        }
        // 3) enumerated() 사용
        for (i, name) in names.enumerated() {
            print(i, name)
        }
    }
    
    func checkSizeOfArray() {
        let names = ["Alice", "Bob", "Charlie"]
        print(names.count) // 3
    }
    
    func checkIfArrayElementContains() {
        let numbers = [10, 20, 30, 40, 50]
        print(numbers.contains(30)) // true
        print(numbers.contains(100)) // false
    }
    
    func checkTime() {
        /*
         배열 요소 관리 문제
         사용자로부터 5개의 단어를 입력받아 배열에 저장한 후,
         1. 특정 단어를 검색하여 있는지 확인하고
         2. 검색된 단어를 삭제한 뒤
         3. 배열을 출력하는 프로그램을 작성하세요.
         
         힌트
         - readLine()을 사용하여 사용자 입력을 받습니다.
         - contains(_:)를 사용하여 배열에 특정 단어가 있는지 확인합니다.
         - remove(at:)을 사용하여 요소를 삭제합니
         
         실행 예
         5개의 단어를 입력하세요:
         Apple
         Banana
         Grape
         Orange
         Mango
         입력한 단어 목록: ["Apple", "Banana", "Grape", "Orange", "Mango"]
         삭제할 단어를 입력하세요:
         Grape
         'Grape'을(를) 삭제하였습니다.
         최종 단어 목록: ["Apple", "Banana", "Orange", "Mango"]
        */
        // 1. 5개의 단어를 입력받아 배열에 저장
        var words: [String] = []
        print("5개의 단어를 입력하세요:")
        for _ in 1...5 {
            if let input = readLine() {
                words.append(input)
            }
        }
        print("입력한 단어 목록: \(words)")
        // 2. 삭제할 단어 입력 받기
        print("삭제할 단어를 입력하세요:")
        if let deleteWord = readLine() {
            if let index = words.firstIndex(of: deleteWord) {
                words.remove(at: index)
                print("'\(deleteWord)'을(를) 삭제하였습니다.")
            } else {
                print("해당 단어가 목록에 없습니다.")
            }
        }
        // 3. 최종 단어 목록 출력
        print("최종 단어 목록: \(words)")
    }
}

