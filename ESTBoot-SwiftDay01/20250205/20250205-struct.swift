//
//  20250205.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/5/25.
//

import Foundation

struct FunctionEx01 {
    func run() {
        print("run FunctionEx01")
        example01(title: "더하기 예제")
        
    }
    
    func example01(title: String) {
        print("첫번째 예제: \(title)")
        let total = add(x: 100, y: 50)
    }
    
    func add(x: Int, y: Int) -> Int {
        return x+y
    }
}

struct FunctionEx02 {
    func run() {
        print("run FunctionEx02")
        
        let userInfo = getUserInfo()
        print("Name: \(userInfo.name)\nAge: \(userInfo.age)")
    }
    
    func getUserInfo() -> (name: String, age: Int) {
        print("Input Name: ", terminator: "")
        let name = readLine()!
        print("Input Age: ", terminator: "")
        let age = Int(readLine() ?? "") ?? 0
        
        return (name, age)
    }
}

struct FunctionEx03 {
    init() { // 객체를 생성하면 바로 실행된다. 멤버를 초기화시키는 용도
        print("FunctionEx03 Init")
        if let result = getName() {
            print("\(result)님 안녕하세요!")
        }
        else {
            print("값이 유효하지 않습니다.")
        }
    }
    
}

extension FunctionEx03 {
    func getName() -> String? {
        return "HM"
    }
}

struct structExampleMain {
    func main() {
        print("실행할 예제 번호: ", terminator: "")
        let no = Int(readLine() ?? "0")

        switch no {
        case 1:
            let ex = FunctionEx01()
            ex.run()
        case 2:
            let ex = FunctionEx02()
            ex.run()
        case 3:
            let ex = FunctionEx03()
        default:
            print("NONE")
        }
    }
}
