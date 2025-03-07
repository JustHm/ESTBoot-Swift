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
        contentVC.tabBarItem = UITabBarItem(title: "Memo", image: UIImage(systemName: "memorychip"), tag: 0)
        let galleryVC = UINavigationController(rootViewController: ImageGalleryViewController())
        galleryVC.tabBarItem = UITabBarItem(title: "Gallery", image: UIImage(systemName: "photo"), tag: 1)
        self.viewControllers = [contentVC, galleryVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
