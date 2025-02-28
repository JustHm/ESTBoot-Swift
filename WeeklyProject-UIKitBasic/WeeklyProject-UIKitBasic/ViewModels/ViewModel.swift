//
//  ViewModel.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit
import Combine

final class ViewModel {
    typealias HomeSnapshot = NSDiffableDataSourceSnapshot<Section, Movie>
    // V -> VM
    var selectedIndexPath = PassthroughSubject<IndexPath, Never>()
    var deleteIndexPath = PassthroughSubject<IndexPath?, Never>()
    var addIndexPath = PassthroughSubject<IndexPath?, Never>()
    
    // VM -> V
    var newSnapshot = CurrentValueSubject<HomeSnapshot, Never>(HomeSnapshot())
    var selectedItem = PassthroughSubject<Movie?, Never>()
    
    // State
    @Published private var movies: [Movie] = []
    private var favorite: [Movie] = []
    private var bag = Set<AnyCancellable>()
    
    
    init() {
        loadMovies()
        makeSnapshot()
        addIndexPath
            .compactMap{$0}
            .compactMap{ [weak self] index in
                self?.movies.remove(at: index.row)
            }
            .sink { [weak self] item in
                var item = item
                item.isFavorite.toggle()
                self?.favorite.append(item)
                self?.makeSnapshot()
            }
            .store(in: &bag)
        deleteIndexPath
            .compactMap{$0}
            .compactMap{ [weak self] index in
                self?.favorite.remove(at: index.row)
            }
            .sink { [weak self] item in
                var item = item
                item.isFavorite.toggle()
                self?.movies.append(item)
                self?.movies.sort(by: {$0.id < $1.id})
                self?.makeSnapshot()
            }
            .store(in: &bag)
        selectedIndexPath
            .sink { [weak self] indexPath in
                switch Section.allCases[indexPath.section] {
                case .common:
                    self?.selectedItem.send(self?.movies[indexPath.row])
                case .favorite:
                    self?.selectedItem.send(self?.favorite[indexPath.row])
                }
            }
            .store(in: &bag)
    }
    
    private func loadMovies() {
        if let url = Bundle.main.url(forResource: "movieData", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            let dto = (try? decoder.decode([MovieDTO].self, from: data)) ?? []
            self.movies = dto.map{$0.convertToEntity()}
        }
    }
    private func loadFavorites() {
        
    }
    private func saveFavorites() {
        
        UserDefaults.standard.set(nil, forKey: "favorite")
    }
    
    private func makeSnapshot() {
        var snapshot = HomeSnapshot()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(favorite, toSection: .favorite)
        snapshot.appendItems(movies, toSection: .common)
        newSnapshot.send(snapshot)
    }
}
