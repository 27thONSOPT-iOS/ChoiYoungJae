//
//  ResultViewController.swift
//  27th_iOS_1Week_Seminar_Project
//
//  Created by 최영재 on 2020/10/10.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var updateStateLabel: UILabel!
    @IBOutlet weak var updateIntervalLabel: UILabel!
    var email: String?
    var isAutoUpdate: Bool?
    var updateInterval: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setLabel(){
        // 옵셔널 바인딩
        if let email = self.email,
           let isAutoUpdate = self.isAutoUpdate,
           let updateInterval = self.updateInterval {
            
            print("호우1")

            // Label에 값을 대입
            self.emailLabel.text = email
            self.emailLabel.sizeToFit()
            
            self.updateStateLabel.text = isAutoUpdate ? "On" : "Off"
            self.updateIntervalLabel.text = "\(updateInterval)분"
        }
    }
}
