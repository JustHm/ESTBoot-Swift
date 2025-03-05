//
//  ViewController.swift
//  EST-UIKit-Advance01
//
//  Created by 안정흠 on 3/4/25.
//

import UIKit
import MobileCoreServices

class CameraPhotoLibraryViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet weak var PreviewImageView: UIImageView!
    
    // UIImagePicker 인스턴스 변수
    let imagePicker = UIImagePickerController()
    // 불러온 사진
    var captureImage: UIImage!
    // URL 저장
    var videoURL: URL!
    // 이미지 저장 여부
    var flagImageSave = false

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recordVideoButtonTap(_ sender: UIButton) {
        showAlert(title: "Record Video", message: "비디오 촬영")
    }
    
    @IBAction func takePhotoButtonTap(_ sender: UIButton) {
        showAlert(title: "Take a photo", message: "사진 촬영")
    }
    
    @IBAction func loadPhotoButtonTap(_ sender: UIButton) {
        showAlert(title: "Load Photo", message: "사진 불러오기")
    }
    
    @IBAction func loadVideoButtonTap(_ sender: UIButton) {
        showAlert(title: "Load Video", message: "비디오 불러오기")
    }
}

extension CameraPhotoLibraryViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
