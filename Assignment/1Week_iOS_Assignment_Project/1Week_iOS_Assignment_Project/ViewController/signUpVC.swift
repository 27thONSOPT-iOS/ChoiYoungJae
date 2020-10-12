//
//  signUpVC.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/10/12.
//

import UIKit

class signUpVC: UIViewController {
    
    @IBOutlet weak var signUpPartNameLabel: UILabel!
    @IBOutlet weak var signUpYearLabel: UILabel!
    @IBOutlet weak var signUpNameLabel: UILabel!
    @IBOutlet weak var signUpPartTextField: UITextField!
    @IBOutlet weak var signUpYearTextField: UITextField!
    @IBOutlet weak var signUpNameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpSet()
        
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension signUpVC {
    private func signUpSet() {
        
        self.navigationItem.title = "Sign Up"
        
        signUpPartNameLabel.text = "파트"
        signUpPartNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        signUpYearLabel.text = "출생년도"
        signUpYearLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        signUpNameLabel.text = "이름"
        signUpNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        signUpButton.setTitle("회원가입", for: .normal)
        self.signUpButton.backgroundColor = UIColor.black
        signUpButton.setTitleColor(.systemYellow, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
    }
}
