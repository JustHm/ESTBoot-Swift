//
//  Review.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import Foundation

struct Review: Codable {
    var id: UUID = UUID()
    var movieID: String
    var username: String = "USER"
    var comment: String
    var rating: Int
}
