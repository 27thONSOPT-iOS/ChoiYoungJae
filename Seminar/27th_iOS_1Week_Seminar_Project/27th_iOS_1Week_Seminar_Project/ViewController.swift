//
//  ViewController.swift
//  27th_iOS_1Week_Seminar_Project
//
//  Created by 최영재 on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sayHelloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpClick(_ sender: Any) {
        sayHelloLabel.text = "우와 솝트다!"
        sayHelloLabel.sizeToFit()
    }
    @IBAction func touchUpMove(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "YellowViewController") else {
            return
        }
//        self.present(dvc, animated: true, completion: nil)
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
}

