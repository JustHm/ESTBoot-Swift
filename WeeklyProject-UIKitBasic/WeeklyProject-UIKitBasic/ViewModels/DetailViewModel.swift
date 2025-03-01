//
//  DetailViewModel.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit
import Combine

final class DetailViewModel {
    typealias DetailSnapShot = NSDiffableDataSourceSnapshot<DetailSection, DetailItem>
    // V -> VM
    var addReviewData = PassthroughSubject<(String, Int), Never>()
    var deleteIndexPath = PassthroughSubject<IndexPath?, Never>()
    
    // VM -> V
    var newSnapshot = CurrentValueSubject<DetailSnapShot, Never>(DetailSnapShot())
    //    var selectedItem = PassthroughSubject<Movie?, Never>()
    
    // State
    private let movie: Movie!
    private var reviews: [Review] = []
    private var bag = Set<AnyCancellable>()
    private let coreData = CoreDataStack()
    
    init(movie: Movie) {
        self.movie = movie
        reviews = loadReviews(id: movie.id)
        makeSnapshot()
        addReviewData
            .sink { [weak self] (comment, rating) in
                self?.saveReviews(comment: comment, rating: rating)
                self?.makeSnapshot()
            }
            .store(in: &bag)
        deleteIndexPath
            .compactMap{$0}
            .sink { [weak self] indexPath in
                self?.deleteReviews(index: indexPath.row)
                self?.makeSnapshot()
            }
            .store(in: &bag)
    }
    
    private func makeSnapshot() {
        var snapShot = NSDiffableDataSourceSnapshot<DetailSection, DetailItem>()
        snapShot.appendSections(DetailSection.allCases)
        snapShot.appendItems([.description(movie: movie)], toSection: .description)
        let reviewsWrapped = reviews.map{DetailItem.review($0)}
        snapShot.appendItems(reviewsWrapped, toSection: .review)
        newSnapshot.send(snapShot)
    }
    
    private func loadReviews(id: String) -> [Review] {
        let data = coreData.fetchFromReviewByMovieID(id)
        let reviews = data.compactMap{ item -> Review? in
            guard let id = item.id,
                let movieID = item.movieID,
                  let username = item.username,
                  let comment = item.comment else { return nil }
            return Review(
                id: id,
                movieID: movieID,
                username: username,
                comment: comment,
                rating: Int(item.rating)
            )
        }
        return reviews
    }
    
    private func saveReviews(comment: String, rating: Int) {
        let newReview = Review(
            movieID: movie.id,
            comment: comment,
            rating: rating
        )
        coreData.addReview(newReview)
        reviews = loadReviews(id: movie.id)
    }
    
    private func deleteReviews(index: Int) {
        let deletedItem = reviews.remove(at: index)
        coreData.deleteReview(deletedItem)
    }
}
