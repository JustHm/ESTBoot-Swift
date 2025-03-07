//
//  ImageGalleryViewController.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import UIKit

class ImageGalleryViewController: UIViewController {
    var datasource: [UIImage] = []
    private var collectionView: UICollectionView!
    private let emptyView: EmptyGuideView = {
        let view = EmptyGuideView(
            systemImage: UIImage(systemName: "photo.stack.fill"),
            title: "사진이 없습니다.",
            message: "오른쪽 위 \"+\" 버튼을 눌러 사진을 추가해보세요"
        )
        view.isHidden = true
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
            action: #selector(plusButtonTap)
        )
        
        setupCollectionView()
        setupLayout()
    }
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let width = (view.bounds.width / 2) - 16
        layout.itemSize = .init(width: width, height: width)
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setupLayout() {
        [collectionView, emptyView].forEach{ view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ImageGalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if datasource.isEmpty {
            collectionView.isHidden = true
            emptyView.isHidden = false
            return 0
        }
        else {
            collectionView.isHidden = false
            emptyView.isHidden = true
            return datasource.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // 기존 뷰 제거 (재사용 문제 방지)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let imageView = UIImageView(frame: cell.contentView.bounds)
        imageView.image = datasource[indexPath.row] // 여기에 실제 이미지 배열에서 가져온 이미지 사용
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .gray.withAlphaComponent(0.3)
        imageView.clipsToBounds = true
        
        cell.contentView.addSubview(imageView)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowRadius = 4

        // clipToBounds를 false로 설정해야 그림자가 잘림 없이 보입니다
        cell.layer.masksToBounds = false // 그림자 효과가 잘리도록 방지
        
        return cell
    }
}

extension ImageGalleryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc private func plusButtonTap() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary //deprecated
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false)
        if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            datasource += [img]
            collectionView.reloadData()
        }
    }
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커 컨트롤러 창 닫기
        print("이미지 선택하지않고 취소한 경우")
        
        self.dismiss(animated: false)
    }
}
