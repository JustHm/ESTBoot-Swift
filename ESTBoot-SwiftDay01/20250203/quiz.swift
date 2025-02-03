//
//  quiz.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/3/25.
//

import Foundation

// 과제: Weekly Project는 다음 Project 전까지 계속 진행.
// 기본과제: 배운것 TIL 정리 ( 배운것 + 알파)
// 퀴즈: 피보나치 수열 출력, 피보나치 수열에 부호 엇갈라서.

func Fibo() {
    let MAX = 21
    var arr = [1, 1]
    var total = arr[0]
    while true {
        let sum = arr[arr.count - 2] + arr[arr.count - 1]
        arr.append(sum)
        if sum == MAX { break }
    }
    // 1 + 1 + 2 + 3 + 5 + 8 + 13 + 21 = 54
    print(arr.map{String($0)}.joined(separator: "+"), terminator: "=")
    print(arr.reduce(0, +))
    
    // 1 + 1 - 2 + 3 - 5 + 8 - 13 + 21 = 14
    print("1", terminator: "")
    for index in 1..<arr.count {
        if (index + 1) % 2 == 0 {
            print("+\(arr[index])", terminator: "")
            total += arr[index]
        }
        else {
            print("-\(arr[index])", terminator: "")
            total -= arr[index]
        }
    }
    print("=\(total)")
    
    
}

