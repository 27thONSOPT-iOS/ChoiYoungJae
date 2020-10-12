//
//  loginVC.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/10/12.
//

import UIKit

class loginVC: UIViewController {
    
    @IBOutlet weak var loginPartNameLabel: UILabel!
    @IBOutlet weak var loginNameLabel: UILabel!
    @IBOutlet weak var loginPartTextField: UITextField!
    @IBOutlet weak var loginNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var moveSignUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginVCSet()
        
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        guard let firstVC = self.presentingViewController as? firstVC else {return}
        
        
        guard let lPTF = self.loginPartTextField.text else { return }
        guard let lNTF = self.loginNameTextField.text else { return }

            print("lPTF : ", lPTF)
            print("lNTF : ", lNTF)

        
        firstVC.part = lPTF
        firstVC.name = lNTF
        
//        firstVC.part = self.loginPartTextField?.text
//        firstVC.name = self.loginNameTextField?.text
 
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func moveSignUpButtonAction(_ sender: Any) {
        guard let signUpVC = self.storyboard?.instantiateViewController(identifier: "signUpVC") else {return}
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
    
}

extension loginVC {
    private func loginVCSet(){
        
        self.navigationItem.title = "Login"
        
        loginPartNameLabel.text = "파트"
        loginPartNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        loginNameLabel.text = "이름"
        loginNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        loginButton.setTitle("로그인", for: .normal)
        self.loginButton.backgroundColor = UIColor.black
        loginButton.setTitleColor(.systemYellow, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        moveSignUpButton.setTitle("회원가입", for: .normal)
        self.moveSignUpButton.backgroundColor = UIColor.black
        moveSignUpButton.setTitleColor(.systemYellow, for: .normal)
        moveSignUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        
    }
}
