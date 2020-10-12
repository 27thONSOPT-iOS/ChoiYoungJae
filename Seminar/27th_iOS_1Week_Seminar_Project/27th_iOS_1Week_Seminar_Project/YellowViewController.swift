//
//  YellowViewController.swift
//  27th_iOS_1Week_Seminar_Project
//
//  Created by 최영재 on 2020/10/10.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpClose(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
