//
//  ReviewCell.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 3/1/25.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    lazy var ratingView: RatingView = {
        let ratingView = RatingView()
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        return ratingView
    }()
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    func configure(review: Review) {
        userLabel.text = "\(review.username) 님의 리뷰"
        commentLabel.text = review.comment
        ratingView.updateStars(currentStar: review.rating)
        ratingView.isUserInteractionEnabled = false // 보기전용이니까
        setupLayout()
    }
    private func setupLayout() {
        [userLabel, ratingView, commentLabel].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            userLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            ratingView.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 8),
            ratingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            commentLabel.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 8),
            commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
}

