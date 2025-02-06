//
//  classExample.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/6/25.
//

import Foundation

class Person {
    // 멤버 필드 선언
    // 캡슐화 (private)
    private var name: String
    private var age: Int
    
    //초기화 함수 (생성자)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // 멤버 메서드 - 객체 외부에서 접근
    func say() {
        print("Hello I'm \(name), \(age)")
    }
}


class Shape {
    func draw() {
        print("도형을 그립니다.")
    }
}

class Circle: Shape {
    override func draw() {
        print("원을 그립니다.")
    }
}

class Rectangle: Shape {
    override func draw() {
        print("직사각형을 그립니다.")
    }
}


class ShapeView {
    var shapeList: [Shape]
    
    init() {
        self.shapeList = []
    }
    
    func showList() {
        for shape in shapeList {
            shape.draw()
        }
    }
    
    func appendShpe(choice: Int) {
        switch choice {
        case 1:
            shapeList.append(Circle())
            print("리스트에 Circle 객체 추가 완료!")
        case 2:
            shapeList.append(Rectangle())
            print("리스트에 Rectangle 객체 추가 완료!")
        default:
            print("객체 추가 실패!: 번호가 없음")
        }
    }
    
    func main() {
        for i in 1...5 {
            print("\(i)번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle", terminator: ": ")
            let choice: Int = Int(readLine() ?? "") ?? 0
            appendShpe(choice: choice)
        }
        
        showList()
        
    }
}
