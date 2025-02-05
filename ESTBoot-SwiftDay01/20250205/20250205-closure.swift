//
//  20250205-closure.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/5/25.
//

import Foundation

struct ClosureExample {
    func ex1() {
        func myFunc() {
            print("myFunc Call")
        }
        let funcTest = myFunc
        
        //변수에 익명함수 담기
        let add = { (a: Int, b: Int) -> Int in
                return a+b
        }
        print(add(1,2)) //3
    }
    func ex2() {
        let numbers = [4,2,3,5,1,6,7,8,9]
        let newNumbers = numbers.map { (num) -> Int in num * 2 }
        print(newNumbers)
        print(newNumbers.sorted{$0 < $1})
    }
    
    func ex3() {
        let numbers = [4,2,3,5,1,6,7,8,9]
        func tripe(num: Int) -> Int {
            return num * 3
        }
        print(numbers.map(tripe))
    }
}
