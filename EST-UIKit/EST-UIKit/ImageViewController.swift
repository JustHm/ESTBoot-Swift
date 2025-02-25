//
//  ImageViewController.swift
//  EST-UIKit
//
//  Created by 안정흠 on 2/25/25.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = true
    

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image = UIImage(named: "lamp_on")
        }
        else {
            imageView.image = UIImage(named: "lamp_off")
        }
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        let scale = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if isZoom {
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            print("ZOOM IN")
        }
        else {
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            print("ZOOM OUT")
        }
        imageView.frame.size = .init(width: newWidth, height: newHeight)
        
        isZoom.toggle()
        sender.setTitle(isZoom ? "확대" : "축소", for: .normal)
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
