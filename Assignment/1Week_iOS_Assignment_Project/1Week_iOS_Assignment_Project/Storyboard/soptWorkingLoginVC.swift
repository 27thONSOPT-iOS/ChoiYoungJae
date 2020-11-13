//
//  soptWorkingLoginVC.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/11/13.
//

import UIKit

class soptWorkingLoginVC: UIViewController {

    @IBOutlet weak var loginImg: UIImageView!
    @IBOutlet weak var loginPartName: UILabel!
    @IBOutlet weak var loginPartTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VCSet()
        move()

    }
    

    @IBAction func loginButtonAction(_ sender: Any) {
        guard let tabController = self.presentingViewController as? LoginTabBarController else {
            return
        }

        if let soptWorkingHomeVC = tabController.viewControllers?[0] as? soptWorkingHomeVC {
            soptWorkingHomeVC.part = self.loginPartTextField.text

        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension soptWorkingLoginVC {
     func VCSet(){
        // 이미지 삽입
        loginImg.image = UIImage(named: "IMG_9277")
        
        // 라벨에 데이터 삽입 및 세팅
        loginPartName.text = "파트"
        loginPartName.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    
                
        loginButton.setTitle("로그인", for: .normal)
        self.loginButton.backgroundColor = UIColor.black
        loginButton.setTitleColor(.systemYellow, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    // 텍스트 필드에 애니메이션 주는 함수
    func move() {
        loginPartTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardUp(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDown(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyBoardUp(_ sender: Notification) {
        
        let move = CGAffineTransform(translationX: 0, y: -100)

        UIView.animate(withDuration: 0.5, animations: {
            self.loginImg.transform = move
            self.loginPartName.transform = move
            self.loginPartTextField.transform = move
        })
        
//        self.view.frame.origin.y = -150
        
    }
    @objc func keyBoardDown(_ sender: Notification) {
//        self.view.frame.origin.y = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.loginImg.transform = .identity
            self.loginPartName.transform = .identity
            self.loginPartTextField.transform = .identity
        })
        
        }
}

//  return을 누르면 키보드가 내려가도록 함
extension soptWorkingLoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
