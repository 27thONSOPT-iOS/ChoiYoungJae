//
//  SignUpVC.swift
//  27th_iOS_6Week_Seminar_Project
//
//  Created by 최영재 on 2020/11/26.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var signUpEmailTextField: UITextField!
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    @IBOutlet weak var signUpUserNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchUpSignUp(_ sender: Any) {
        guard let signUpEmailText = signUpEmailTextField.text,
              let signUpPwText = signUpPasswordTextField.text,
              let signUpNameText = signUpUserNameTextField.text else {
            return
        }
        
        AuthService.shared.signUp(email: signUpEmailText, password: signUpPwText, username: signUpNameText)
        { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let signUpData = data as? SignUpData {
                    UserDefaults.standard.set(signUpData.userName, forKey: "userName")
                }
                self.dismiss(animated: true, completion: nil)

            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
        
    }
    

}
