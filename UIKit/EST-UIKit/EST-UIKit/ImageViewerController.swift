//
//  ImageViewerController.swift
//  EST-UIKit
//
//  Created by 안정흠 on 2/25/25.
//

import UIKit

class ImageViewerController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 16
        imageView.image = UIImage(named: "0")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("WillAppear")
    }
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("IsAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("WillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("DidDisappear")
    }

    @IBAction func nextButtonTap(_ sender: Any) {
        imageIndex = imageIndex == 3 ? imageIndex : imageIndex + 1
        imageView.image = UIImage(named: "\(imageIndex)")
    }
    @IBAction func prevButtonTap(_ sender: Any) {
        imageIndex = imageIndex == 0 ? imageIndex : imageIndex - 1
        imageView.image = UIImage(named: "\(imageIndex)")
    }
}
