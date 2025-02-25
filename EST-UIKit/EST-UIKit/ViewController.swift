//
//  ViewController.swift
//  EST-UIKit
//
//  Created by 안정흠 on 2/25/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Tap \(sender.titleLabel?.text)")
        if sender == resetButton {
            print("리셋 버튼 탭!")
        }
        else {
            print("버튼이 sender인 경우")
        }
    }
}

