//
//  MovieDescriptionCell.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit

class MovieDescriptionCell: UITableViewCell {
    lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .black)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var directorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    func configure(movie: Movie) {
        posterView.image = UIImage(named: movie.title)
        titleLabel.text = movie.title
        directorLabel.text = movie.director
        releaseDateLabel.text = movie.releaseDate.formatted(.dateTime)
        genreLabel.text = movie.genre
        
        setupLayout()
    }
    
    private func setupLayout() {
        [posterView, titleLabel, directorLabel, releaseDateLabel, genreLabel]
            .forEach {
                contentView.addSubview($0)
            }
        // 라벨이 길어지면 밀리는거 때문에 priority 설정이 필요함
        // 오류는 아니고 런타임중 경고? 보라색 경고떠서 추가함
        // 실기기, 시뮬레이션에는 잘 나오지만 그래도 문제를 고쳐보려고 넣었다.
        titleLabel.setContentHuggingPriority(.defaultHigh + 3, for: .vertical)
        directorLabel.setContentHuggingPriority(.defaultHigh + 2, for: .vertical)
        releaseDateLabel.setContentHuggingPriority(.defaultHigh + 1, for: .vertical)
        //genreLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        // TableView의 DynamicHeight를 사용하려면 cell의 contentView에 넣고 constraint 정의해줘야함
        // 이런 방식으로도 activate 가능
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterView.heightAnchor.constraint(equalToConstant: 250),
            
            titleLabel.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            directorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            directorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            directorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            releaseDateLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 8),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            genreLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // 마지막 요소의 bottomAnchor를 설정해야 동적 높이 계산 가능
            genreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
