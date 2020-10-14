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
    
    var part: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VCSet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
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
        
        helloLabel.text = "저는 도전과제도 못하는 바보입니다"
        
        moveLoginButton.setTitle("로그인 하러 가기", for: .normal)
        moveLoginButton.setTitleColor(.lightGray, for: .normal)
        
    }

    
    private func getData(){
        // 옵셔널 바인딩
        if let part = self.part,
           let name = self.name {
            // 값 대입
            self.partLabel.text = part
//            self.partLabel.sizeToFit()
            self.helloLabel.text = "\(name) 이 자식아 정신차리라고"
//            self.helloLabel.sizeToFit()


        }
    }
}

