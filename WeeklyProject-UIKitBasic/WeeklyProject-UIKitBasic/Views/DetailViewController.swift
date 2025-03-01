//
//  DetailViewController.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    typealias DataSource = UITableViewDiffableDataSource<DetailSection, DetailItem>
    var datasource: DataSource!
    var tableView: UITableView!
    var viewModel: DetailViewModel!
    private var bag = Set<AnyCancellable>()
    
    init(movie: Movie) {
        viewModel = DetailViewModel(movie: movie)
        super.init(nibName: nil, bundle: nil)
        title = movie.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupNavigationBar()
        setupDatasource()
        bind()
    }
    private func bind() {
        viewModel.newSnapshot
            .sink { [weak self] snapshot in
                self?.applyDatasource(snapshot: snapshot)
            }
            .store(in: &bag)
    }
    private func setupUI() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.delegate = self
        tableView.register(MovieDescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
        tableView.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
        view.addSubview(tableView)
    }
    
    private func setupNavigationBar() {
        let button = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(showReviewAlert))
        navigationItem.rightBarButtonItem = button
    }
    
    private func applyDatasource(snapshot: NSDiffableDataSourceSnapshot<DetailSection, DetailItem>) {
        datasource.apply(snapshot)
    }
    
    private func setupDatasource() {
        datasource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case let .description(movie):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "DescriptionCell",
                    for: indexPath
                ) as? MovieDescriptionCell else { return UITableViewCell() }
                cell.configure(movie: movie)
                return cell
            case .review(let review):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "ReviewCell",
                    for: indexPath
                ) as? ReviewCell else { return UITableViewCell() }
                cell.configure(review: review)
                return cell
            }
        })
        tableView.dataSource = datasource
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return nil
    }
}

enum DetailSection: CaseIterable {
    case description
    case review
}

enum DetailItem: Hashable {
    case description(movie: Movie)
    case review(Review)
}


extension DetailViewController {
    @objc func showReviewAlert() {
        let alert = UIAlertController(title: "리뷰 작성", message: nil, preferredStyle: .alert)
        
        // 컨테이너 뷰 생성 (텍스트필드 + RatingView 포함) (Alert dynamic frame? 을 위해)
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 100))
        
        // RatingView 추가
        let ratingView = RatingView(frame: CGRect(x: 0, y: 0, width: 250, height: 40))
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(ratingView)
        
        // 텍스트 필드 추가
        let textField = UITextField(frame: CGRect(x: 0, y: 50, width: 250, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "리뷰를 입력하세요."
        textField.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            ratingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            ratingView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
        
        // contentViewController를 이용해 alert 크기 확장
        let vc = UIViewController()
        vc.view = containerView
        vc.preferredContentSize = CGSize(width: 270, height: 100)
        alert.setValue(vc, forKey: "contentViewController")
        
        // 버튼 추가
        let submitAction = UIAlertAction(title: "등록", style: .default)
        { [weak self] _ in
            let reviewText = textField.text ?? ""
            let rating = ratingView.currentStar
            self?.viewModel.addReviewData.send((reviewText, rating))
            print("입력된 리뷰: \(reviewText), 별점: \(rating)")
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)

        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
