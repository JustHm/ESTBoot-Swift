//
//  HomeViewController.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    typealias HomeDataSource = UICollectionViewDiffableDataSource<Section, Movie>
    var dataSource: HomeDataSource!
    var collectionView: UICollectionView!
    private let viewModel = ViewModel()
    private var bag = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupCollectionView()
        setupCollectionDataSource()
        viewModel.newSnapshot
            .sink { [weak self] snapshot in
                self?.applyDatasource(snapshot: snapshot)
            }
            .store(in: &bag)
        viewModel.selectedItem
            .compactMap{$0}
            .sink { [weak self] item in
                let vc = DetailViewController(movie: item)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            .store(in: &bag)
    }
    
    private func applyDatasource(snapshot: NSDiffableDataSourceSnapshot<Section, Movie>) {
        dataSource.apply(snapshot)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.45, height: 250)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureLayout())
        collectionView.delegate = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "Header")
        view.addSubview(collectionView)
    }
    
    private func setupCollectionDataSource() {
        dataSource = HomeDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell
            else { return UICollectionViewCell() }
            
            cell.configure(title: itemIdentifier.title)
            return cell
        })
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "Header",
                for: indexPath)
            let label = UILabel()
            label.text = Section.allCases[indexPath.section].header
            label.font = .systemFont(ofSize: 24, weight: .black)
            label.frame = header.bounds
            header.addSubview(label)
            return header
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        guard let indexPathSection = indexPaths.first?.section else { return nil }
        
        let section = Section.allCases[indexPathSection]
        // iOS 13+ context menu configuration
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            let addAction = UIAction(title: "즐겨찾기 추가", image: UIImage(systemName: "star")) { [weak self] action in
                self?.viewModel.addIndexPath.send(indexPaths.first)
            }
            let deleteAction = UIAction(title: "즐겨찾기 제거", image: UIImage(systemName: "trash"), attributes: .destructive) { [weak self] action in
                self?.viewModel.deleteIndexPath.send(indexPaths.first)
            }
            return UIMenu(
                title: "",
                children: section == .common ? [addAction] : [deleteAction]
            )
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedIndexPath.send(indexPath)
    }
}


extension HomeViewController {
    func configureLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] section, layout in
            let section = Section.allCases[section]
            switch section {
            case .common:
                return self?.commonSectionLayout()
            case .favorite:
                return self?.favoriteSectionLayout()
            }
        }
    }
    private func favoriteSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.89), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(250))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [createSectionHeader()]
        section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        return section
    }
    private func commonSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(250))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        group.interItemSpacing = .fixed(16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeader()]
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        return section
    }
    
    // create badge
    private func createGroupBadge() -> NSCollectionLayoutSupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .estimated(24), heightDimension: .estimated(24))
        let anchor = NSCollectionLayoutAnchor(edges: [.top, .trailing], fractionalOffset: CGPoint(x: 0, y: -1))
        let badge = NSCollectionLayoutSupplementaryItem(layoutSize: layoutSize, elementKind: ElementKind.badge, containerAnchor: anchor)
        return badge
    }
    // sectionHeader Layout settings
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        return sectionHeader
    }
}

enum Section: Int, CaseIterable, Hashable {
    case favorite
    case common
    
    var header: String {
        switch self {
        case .common: return "영화 목록"
        case .favorite: return "즐겨찾기"
        }
    }
}
struct ElementKind {
    static let badge = "badge-element-kind"
    static let background = "background-element-kind"
    static let sectionHeader = "section-header-element-kind"
    static let sectionFooter = "section-footer-element-kind"
    static let layoutHeader = "layout-header-element-kind"
    static let layoutFooter = "layout-footer-element-kind"
}
