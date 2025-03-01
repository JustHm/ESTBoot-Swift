//
//  ReviewAlertController.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 3/1/25.
//

import UIKit

final class ReviewAlertController: UIAlertController {
    var comment: String {
        get {
            return commentField.text ?? ""
        }
    }
    var rating: Int {
        get {
            return ratingView.currentStar
        }
    }
    private var contentView: UIView = {
        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var ratingView: RatingView = {
        let ratingView = RatingView()
        ratingView.sizeToFit()
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        return ratingView
    }()
    private var commentField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "리뷰를 입력하세요."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
    }
    private func setupSubView() {
        [ratingView].forEach {
            view.addSubview($0)
        }
//        view.addSubview(contentView)
        // contentViewController를 이용해 alert 크기 확장
//        let vc = UIViewController()
//        vc.view = contentView
//        self.setValue(vc, forKey: "contentViewController")
        
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: view.topAnchor),
            ratingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ratingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
//            commentField.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 10),
//            commentField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            commentField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
}
