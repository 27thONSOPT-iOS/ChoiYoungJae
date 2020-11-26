//
//  LoginVC.swift
//  27th_iOS_6Week_Seminar_Project
//
//  Created by 최영재 on 2020/11/21.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text else {
            return
        }
        AuthService.shared.signIn(email: emailText, password: passwordText)
        { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let signInData = data as? SignInData {
                    self.simpleAlert(title: "로그인 성공", message:
                                        "\(signInData.userName)님 로그인 성공!")
                    UserDefaults.standard.set(signInData.userName, forKey: "userName")
                }
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "로그인 실패", message: message)
                }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    @IBAction func touchUpSignUp(_ sender: Any) {
        let signUpStoryBoard = UIStoryboard(name: "SignUp", bundle: nil)
        
        if let dvc = signUpStoryBoard.instantiateViewController(identifier: "SignUpVC") as? SignUpVC{
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true, completion: nil)
        }
        
    }
    
    
}

