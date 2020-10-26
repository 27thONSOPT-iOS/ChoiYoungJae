//
//  soptWorkingScrollView.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/10/26.
//

import UIKit

class soptWorkingScrollView: UIViewController {

    @IBOutlet weak var headerViewLogo: UIImageView!
    @IBOutlet weak var headerViewButton: UIButton!
    
    @IBOutlet weak var bannerImg: UIImageView!
    @IBOutlet weak var bannerNameLabel: UILabel!
    @IBOutlet weak var bannerContentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerviewSet()
        bannerViewSet()
    }
    

    func headerviewSet(){
        headerViewLogo.image = UIImage(named : "soptLogo")
        
        headerViewButton.setTitle("프로필 작성하기", for: .normal)
        headerViewButton.setTitleColor(.white, for: .normal)
        headerViewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        headerViewButton.setBackgroundImage(UIImage(named: "profileBtn.png"), for: .normal)
    }
    
    func bannerViewSet(){
        bannerImg.image = UIImage(named : "banner")
        bannerNameLabel.text = "SOPT + NETWORKING"
        bannerNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        bannerNameLabel.textColor = .white


        bannerContentLabel.text = "대학생 연합 IT 창업 동아리의 네트워킹을 위한 플랫폼입니다."
        bannerContentLabel.font = UIFont.systemFont(ofSize: 10)
        bannerContentLabel.textColor = .white



    }
    
}
