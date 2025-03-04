//
//  MovieCell.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit

class MovieCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray.withAlphaComponent(0.5)
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        // shadow
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 4
        label.layer.masksToBounds = false
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func configure(title: String) {
        imageView.image = UIImage(named: title)
        titleLabel.text = title
        //contentView에 shadow, imageView를 raound 처리 그리고 contentView에 addsubView 하면 다 적용됌
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
}
