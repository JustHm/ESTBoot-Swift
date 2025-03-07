//
//  EmptyGuideViewController.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import UIKit

final class EmptyGuideViewController: UIViewController {
    private let iconImageView: UIImageView
    private let guideTitleLabel: UILabel
    private let guideMessage: UILabel
    
    init(systemImage: UIImage?, title: String, message: String) {
        iconImageView = UIImageView(image: systemImage)
        guideTitleLabel = UILabel()
        guideMessage = UILabel()
        
        guideTitleLabel.text = title
        guideMessage.text = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupLayout() {
        [iconImageView, guideTitleLabel, guideMessage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 64),
            iconImageView.widthAnchor.constraint(equalToConstant: 64),
            iconImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            guideTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            guideTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            guideTitleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16),
            
            guideMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            guideMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            guideMessage.topAnchor.constraint(equalTo: guideTitleLabel.bottomAnchor, constant: 16)
        ])
    }
    
    private func setupViewProperties() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .gray
        
        guideTitleLabel.font = .preferredFont(forTextStyle: .title1)
        guideMessage.font = .preferredFont(forTextStyle: .body)
        
        [guideTitleLabel, guideMessage].forEach {
            $0.textColor = .gray
            $0.numberOfLines = 0
        }
    }
}
