//
//  20250124quiz.swift
//  ESTBoot-SwiftDay01
//
//  Created by 안정흠 on 2/4/25.
//

import Foundation

func get100Day() {
    var monthDays: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    //MARK: 입력
    print("월을 입력하세요:", terminator: " ")
    let month = Int(readLine()!)!
    print("일을 입력하세요:", terminator: " ")
    let day = Int(readLine()!)!
    
    //MARK: 1월 1일부터 입력받을 월까지의 누적일 계산
    let total = monthDays[..<month].reduce(0, +) - (monthDays[month - 1] - day)
    
    //MARK: 입력받을 날짜로부터 100일 후 계산
    var afterDay = 0
    var afterMonth = 0
    var sum = monthDays[month - 1] - day
    var index = month
    while true {
        sum += monthDays[index % 12]
        if sum >= 100 {
            afterMonth = (index % 12) + 1
            afterDay = monthDays[(index % 12)] - (sum - 100)
            break
        }
        index += 1
        
    }
    //MARK: 결과
    print("\n기준일 포함 결과\n-------------")
    print("1월 1일 부터 \(month)월 \(day)일 까지의 누적일 수는 \(total)일")
    print("\(month)월 \(day)일의 100일 후는 \(afterMonth)월 \(afterDay - 1)일")
}
