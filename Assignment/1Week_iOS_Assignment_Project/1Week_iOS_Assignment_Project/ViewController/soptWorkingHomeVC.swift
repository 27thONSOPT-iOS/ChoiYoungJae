//
//  soptWorkingHomeVC.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/11/13.
//

import UIKit

class soptWorkingHomeVC: UIViewController {
    
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var homePartName: UILabel!
    @IBOutlet weak var homePartLabel: UILabel!
    @IBOutlet weak var homeLoginButton: UIButton!
    
    var part: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VCSet()
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
 
    
    @IBAction func moveLoginVC(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "soptWorkingLoginVC") else {return}
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}

extension soptWorkingHomeVC {
    private func VCSet(){
        // 이미지 삽입
        homeImg.image = UIImage(named: "IMG_8167")
        
        // 라벨에 데이터 삽입 및 세팅
        homePartName.text = "파트"
        homePartName.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        
        homePartLabel.text = "룰룰"
                
        homeLoginButton.setTitle("로그인 하러 가기", for: .normal)
        homeLoginButton.setTitleColor(.lightGray, for: .normal)
        
    }
    
    private func getData(){
        // 옵셔널 바인딩
        if let part = self.part{
            // 값 대입
            self.homePartLabel.text = part
        }
    }
    
    
}
