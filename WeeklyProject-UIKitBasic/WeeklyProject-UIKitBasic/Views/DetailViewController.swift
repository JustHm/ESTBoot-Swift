//
//  DetailViewController.swift
//  WeeklyProject-UIKitBasic
//
//  Created by 안정흠 on 2/28/25.
//

import UIKit

class DetailViewController: UIViewController {
    var tableView: UITableView!
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = movie.title
        view.backgroundColor = .white
        
        setupUI()
        setupNavigationBar()
    }
    
    func setupUI() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieDescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
        view.addSubview(tableView)
    }
    
    func setupNavigationBar() {
        let button = UIBarButtonItem(image: UIImage(systemName: movie.isFavorite ? "star.fill" : "star"), style: .plain, target: self, action: #selector(rightBarButtonTap))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func rightBarButtonTap() {
        movie.isFavorite.toggle()
        setupNavigationBar()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard DetailSection.allCases[section] == .review else { return 1 }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as? MovieDescriptionCell else { return UITableViewCell() }
        
        cell.configure(
            title: movie.title,
            director: movie.director,
            releaseDate: movie.releaseDate,
            genre: movie.genre
        )
        return cell
    }
    
    
}

enum DetailSection: CaseIterable {
    case description
    case reviewSearch
    case review
}


