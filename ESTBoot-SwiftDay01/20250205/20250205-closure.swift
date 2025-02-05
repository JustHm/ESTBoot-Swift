//
//  20250205-closure.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/5/25.
//

import Foundation

struct ClosureExample {
    func ex1() {
        //변수에 함수 담기
        let add = { (a: Int, b: Int) -> Int in
                return a+b
        }
        //print(add(1,2)) //3

        func myFunc() {
            print("myFunc Call")
        }
        let funcTest = myFunc
    }
}
