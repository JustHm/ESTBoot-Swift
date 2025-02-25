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
        imageView.image = UIImage(named: "0")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextButtonTap(_ sender: Any) {
        imageIndex = imageIndex == 3 ? imageIndex : imageIndex + 1
        imageView.image = UIImage(named: "\(imageIndex)")
    }
    @IBAction func prevButtonTap(_ sender: Any) {
        imageIndex = imageIndex == 0 ? imageIndex : imageIndex - 1
        imageView.image = UIImage(named: "\(imageIndex)")
    }
}
