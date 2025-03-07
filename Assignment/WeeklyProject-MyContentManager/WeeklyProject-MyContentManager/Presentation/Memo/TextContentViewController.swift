//
//  ViewController.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import UIKit

class TextContentViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .infinite, style: .grouped)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private let emptyView: EmptyGuideView = {
        let view = EmptyGuideView(
            systemImage: UIImage(systemName: "text.document"),
            title: "메모가 없습니다.",
            message: "오른쪽 위 \"+\" 버튼을 눌러 메모를 추가하세요"
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Memo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: nil
        )
        setupLayout()
    }
    
    private func setupLayout() {
        [tableView, emptyView].forEach{ view.addSubview($0) }

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}




#if DEBUG
import SwiftUI
struct TextContentViewControllerPreview: PreviewProvider {
    static var previews: some View {
        TextContentViewController().toPreview()
    }
}
#endif
