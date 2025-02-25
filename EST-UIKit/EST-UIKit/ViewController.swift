//
//  ViewController.swift
//  EST-UIKit
//
//  Created by 안정흠 on 2/25/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Tap \(sender.titleLabel?.text ?? "NIL")")
        if sender == resetButton {
            print("리셋 버튼 탭!")
            helloLabel.text = "Hello"
            nameField.text = ""
        }
        else {
            print("버튼이 send인 경우")
            guard let name = nameField.text else {
                print("NOPE")
                return
            }
            print(name)
            helloLabel.text = "\(name)님 안녕하세요"
            
        }
    }
}

