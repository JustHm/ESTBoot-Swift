//
//  MainTabBarViewController.swift
//  WeeklyProject-MyContentManager
//
//  Created by 안정흠 on 3/7/25.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let contentVC = UINavigationController(rootViewController: TextContentViewController())
        contentVC.tabBarItem = UITabBarItem(title: "Memo", image: UIImage(systemName: "text.document"), tag: 0)
        let galleryVC = UINavigationController(rootViewController: ImageGalleryViewController())
        galleryVC.tabBarItem = UITabBarItem(title: "Gallery", image: UIImage(systemName: "photo.stack.fill"), tag: 1)
        self.viewControllers = [contentVC, galleryVC]
        
        self.tabBar.backgroundColor = .white.withAlphaComponent(0.8)
    }
}
