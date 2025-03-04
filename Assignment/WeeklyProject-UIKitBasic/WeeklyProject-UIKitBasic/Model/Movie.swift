//
//  Movie.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import Foundation

struct Movie: Codable, Hashable {
    var id: String
    var title: String
    var director: String
    var releaseDate: Date
    var genre: String
    var isFavorite: Bool
}

struct MovieDTO: Codable {
    var id: String
    var title: String
    var director: String
    var releaseDate: String
    var genre: String
}

extension MovieDTO {
    func convertToEntity() -> Movie {
        return Movie(
            id: self.id,
            title: self.title,
            director: self.director,
            releaseDate: (try? Date(self.releaseDate, strategy: .dateTime)) ?? Date(),
            genre: self.genre,
            isFavorite: false
        )
    }
}
