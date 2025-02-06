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
