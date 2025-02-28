//
//  ReviewViewController.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit

class ReviewViewController: UIViewController {
    var movieID: UUID!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Write Review"
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 40))
        textField.placeholder = "Enter your review"
        view.addSubview(textField)
    }
}

