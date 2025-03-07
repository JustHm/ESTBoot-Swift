//
//  ImageGalleryViewController.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import UIKit

class ImageGalleryViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    private let emptyView = EmptyGuideView(
        systemImage: UIImage(systemName: "text.document"),
        title: "메모가 없습니다.",
        message: "오른쪽 위 "+" 버튼을 눌러 메모를 추가하세요"
    )
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ImageGalleryViewController {

}
