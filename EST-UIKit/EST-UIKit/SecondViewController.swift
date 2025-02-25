//
//  SecondViewController.swift
//  EST-UIKit
//
//  Created by 안정흠 on 2/25/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operationField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var firstField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resultButtonTap(_ sender: UIButton) {
        guard let first = Int(firstField.text ?? ""),
              let second = Int(secondField.text ?? ""),
              let op = operationField.text  else {
            resultLabel.text = "올바른 숫자와 연산자를 입력해주세요."
            return
        }
        switch op {
        case "+":
            resultLabel.text = "결과: \(first + second)"
        case "-":
            resultLabel.text = "결과: \(abs(first - second))"
        default:
            resultLabel.text = "잘못된 연산자 (+, - 사용가능)"
        }
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
