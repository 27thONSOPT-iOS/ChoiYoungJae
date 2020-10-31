//
//  PartBannerCell.swift
//  27th_iOS_3Week_Seminar_Project
//
//  Created by 최영재 on 2020/11/01.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    @IBOutlet weak var partImageView: UIImageView!
    static let identifier = "PartBannerCell"
    
    func setImage(imageName: String) {
        partImageView.image = UIImage(named: imageName)
    }
}
