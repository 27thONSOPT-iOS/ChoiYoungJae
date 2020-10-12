//
//  loginVC.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/10/12.
//

import UIKit

class firstVC: UIViewController {
    
    @IBOutlet weak var firstViewImg: UIImageView!
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var moveLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VCSet()
        
    }
    
    @IBAction func moveLoginButtonAction(_ sender: Any) {
        guard let navVC = self.storyboard?.instantiateViewController(identifier: "navigationControllerVC") else {return}
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
}

extension firstVC {
    private func VCSet(){
        // 이미지 삽입
        firstViewImg.image = UIImage(named: "IMG_8167")
        
        // 라벨에 데이터 삽입 및 세팅
        partNameLabel.text = "파트"
        partNameLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        
        partLabel.text = "iOS"
        
        helloLabel.text = "영재야 정신차려"
        
        moveLoginButton.setTitle("로그인 하러 가기", for: .normal)
        moveLoginButton.setTitleColor(.lightGray, for: .normal)
    }
}
