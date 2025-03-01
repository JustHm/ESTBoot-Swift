//
//  RatingView.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 3/1/25.
//

import UIKit

class RatingView: UIView {

    var starNumber: Int = 5 {
        didSet { bind() }
    }
    var currentStar: Int = 0

    private var buttons: [UIButton] = []

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        view.backgroundColor = .white
        view.alignment = .center
        view.distribution = .equalSpacing
        return view
    }()

    lazy var starFillImage: UIImage? = {
        return UIImage(systemName: "star.fill")
    }()

    lazy var starEmptyImage: UIImage? = {
        return UIImage(systemName: "star")
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        starNumber = 5
        addSubviews()
        setupLayout()
    }

    private func addSubviews() {
        addSubview(stackView)
        self.backgroundColor = .clear
        stackView.backgroundColor = .clear
    }

    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    func bind() {
        for i in 0..<5 {
            let button = UIButton()
            button.setImage(starEmptyImage, for: .normal)
            button.tag = i
            buttons += [button]
            stackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        }
    }

    @objc
    private func didTapButton(sender: UIButton) {
        let end = sender.tag

        for i in 0...end {
            buttons[i].setImage(starFillImage, for: .normal)
        }
        for i in end + 1..<starNumber {
            buttons[i].setImage(starEmptyImage, for: .normal)
        }

        currentStar = end + 1
    }
    
    func updateStars(currentStar: Int) {
        self.currentStar = currentStar
        for i in 0..<starNumber {
            let image = i < currentStar ? starFillImage : starEmptyImage
            buttons[i].setImage(image, for: .normal)
        }
    }
}
