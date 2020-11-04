//
//  soptWorkingScrollView.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/10/26.
//

import UIKit

class soptWorkingScrollView: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var headerViewLogo: UIImageView!
    @IBOutlet weak var headerViewButton: UIButton!
    
    @IBOutlet weak var bannerImg: UIImageView!
    @IBOutlet weak var bannerNameLabel: UILabel!
    @IBOutlet weak var bannerContentLabel: UILabel!
    
    @IBOutlet weak var soptWorkingScrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var topButton: UIButton!
    @IBAction func topUpButtonAction(_ sender: Any) {
        soptWorkingScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerViewSet()
        bannerViewSet()
        topButtonSet()
        soptWorkingScrollView.delegate = self
    }
    

    func headerViewSet(){
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
    
    func topButtonSet(){
        topButton.backgroundColor = #colorLiteral(red: 255/255, green: 213/255, blue: 0/255, alpha: 1)
        topButton.layer.cornerRadius = 25
        topButton.setTitle("Top", for: .normal)
        topButton.setTitleColor(.white, for: .normal)
        topButton.isHidden = true

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(soptWorkingScrollView.contentOffset.y >  (bannerImg.image?.size.height)!){
                topButton.isHidden = false
        }
        else {
            topButton.isHidden = true
        }
    }
}
