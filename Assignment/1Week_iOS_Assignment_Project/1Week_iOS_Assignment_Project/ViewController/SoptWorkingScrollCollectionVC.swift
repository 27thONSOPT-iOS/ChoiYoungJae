//
//  SoptWorkingScrollCollectionVC.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/11/04.
//

import UIKit

class SoptWorkingScrollCollectionVC: UIViewController {
    
    @IBOutlet weak var headerLogo: UIImageView!
    @IBOutlet weak var headerButton: UIButton!
    
    @IBOutlet weak var soptBannerImg: UIImageView!
    @IBOutlet weak var soptBannerNameLabel: UILabel!
    @IBOutlet weak var soptBannerContentLabel: UILabel!
    @IBOutlet weak var soptBannerBarView: UIView!
    
    @IBOutlet weak var soptWorkingCollectionView: UICollectionView!
    
    
    var soptPeople : [soptPeopleData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerViewSet()
        bannerViewSet()
        setSoptPeopleData()
        self.soptWorkingCollectionView.delegate = self
        self.soptWorkingCollectionView.dataSource = self
    }
    
    
    
    func headerViewSet(){
        headerLogo.image = UIImage(named : "soptLogo")
        
        headerButton.setTitle("프로필 작성하기", for: .normal)
        headerButton.setTitleColor(.white, for: .normal)
        headerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        headerButton.setBackgroundImage(UIImage(named: "profileBtn.png"), for: .normal)
    }
    
    func bannerViewSet(){
        soptBannerImg.image = UIImage(named : "banner")
        soptBannerNameLabel.text = "SOPT + NETWORKING"
        soptBannerNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        soptBannerNameLabel.textColor = .white
        
        soptBannerBarView.backgroundColor = #colorLiteral(red: 255/255, green: 213/255, blue: 0/255, alpha: 1)
        
        soptBannerContentLabel.text = "대학생 연합 IT 창업 동아리의 네트워킹을 위한 플랫폼입니다."
        soptBannerContentLabel.font = UIFont.systemFont(ofSize: 10)
        soptBannerContentLabel.textColor = .white
        
    }
    
    
    func setSoptPeopleData()
    {
        self.soptPeople.append(contentsOf: [
            
            soptPeopleData(name: "이주혁", image: "juhyeok", content: "#hereis#아요#내꿈은#사과농장#ENFP"),
            soptPeopleData(name: "김나연", image: "nayeon", content: "#이제막학기 #여러분들이랑_친해지고_싶어요#번개스터디환영"),
            soptPeopleData(name: "손평화", image: "peace", content: "#핸드피쓰 #이너피쓰 #배꼽도둑#헬린이 #sson_peace7"),
            soptPeopleData(name: "유희수", image: "heesoo", content: "#총무꿈나무 #유총무 #현재_소식중 #풉"),
            soptPeopleData(name: "박세은", image: "saeeun", content: "#마 #아요는 #처음입니다"),
            soptPeopleData(name: "한울", image: "wool", content: "#ENFP #STORM #울크박스 #@hwooolll #하늘콜렉터"),
            soptPeopleData(name: "김한솔", image: "hansol", content: "#고객중심#고객행동데이터기반한#UX디자이너#워너비,,"),
            soptPeopleData(name: "배민주", image: "minju", content: "#디팟장 #개자이너 #최종목표는행복"),
            soptPeopleData(name: "최영훈", image: "younghun", content: "#서팟짱 #솝트3회차 #앱잼_요리_개발자 #UX/UI"),
            soptPeopleData(name: "강민구", image: "minguru", content: "#밍맹 #안팟장 #이래뵈도_귀여운거좋아함 #지박령 #허당"),
            soptPeopleData(name: "이정연", image: "yeonjeong", content: "#플레이스픽 #ENFJ #기획_디자인_개발_다"),
            soptPeopleData(name: "홍준엽", image: "junyeop", content: "#26기서버 #27기웹 #샵이_두개면_어떻게될까? ##")
            
        ])
        
    }
}

extension SoptWorkingScrollCollectionVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return soptPeople.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let soptWorkingCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoptWorkingCell", for: indexPath) as? soptWorkingCollectionViewCell else {return UICollectionViewCell() }
        
        
        soptWorkingCollectionViewCell.setSoptWorkingData(name: soptPeople[indexPath.row].name, image: soptPeople[indexPath.row].image, content: soptPeople[indexPath.row].content )
        
        
        soptWorkingCollectionViewCell.soptUserBarView.backgroundColor = #colorLiteral(red: 255/255, green: 213/255, blue: 0/255, alpha: 1)
        soptWorkingCollectionViewCell.soptUserNameLabel.font = UIFont.boldSystemFont(ofSize: 12)
        soptWorkingCollectionViewCell.soptUserNameLabel.textColor = .white
        soptWorkingCollectionViewCell.soptUserContentLabel.font = UIFont.systemFont(ofSize: 11)
        
        return soptWorkingCollectionViewCell
    }
}

extension SoptWorkingScrollCollectionVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.soptWorkingCollectionView.frame.width - 27) / 2
        let height =  width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
