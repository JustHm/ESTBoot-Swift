//
//  ViewController.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import UIKit

class TextContentViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    private let emptyView = EmptyGuideView(
        systemImage: UIImage(systemName: "photo.stack.fill"),
        title: "사진이 없습니다.",
        message: "오른쪽 위 "+" 버튼을 눌러 사진을 추가해보세요"
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
#if DEBUG
import SwiftUI
struct TextContentViewControllerPreview: PreviewProvider {
    static var previews: some View {
        TextContentViewController().toPreview()
    }
}
#endif
