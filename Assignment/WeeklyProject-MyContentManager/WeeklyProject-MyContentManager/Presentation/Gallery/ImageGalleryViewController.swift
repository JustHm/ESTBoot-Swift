//
//  ImageGalleryViewController.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import UIKit

class ImageGalleryViewController: UIViewController {
    private var collectionView: UICollectionView!
    private let emptyView: EmptyGuideView = {
        let view = EmptyGuideView(
            systemImage: UIImage(systemName: "photo.stack.fill"),
            title: "사진이 없습니다.",
            message: "오른쪽 위 \"+\" 버튼을 눌러 사진을 추가해보세요"
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Gallery"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: nil
        )
        
        setupCollectionView()
        setupLayout()
    }
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let width = (view.bounds.width/2 + 24)
        layout.itemSize = .init(width: width, height: width)
        collectionView = UICollectionView(frame: .infinite, collectionViewLayout: layout)
    }
    private func setupLayout() {
        [/*collectionView,*/ emptyView].forEach{ view.addSubview($0) }

        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ImageGalleryViewController {

}
