//
//  soptWorkingCollectionViewCell.swift
//  1Week_iOS_Assignment_Project
//
//  Created by 최영재 on 2020/11/04.
//

import UIKit

class soptWorkingCollectionViewCell: UICollectionViewCell {
    static let identifier = "SoptWorkingCell"
    
    
    @IBOutlet weak var soptUserImage: UIImageView!
    @IBOutlet weak var soptUserNameLabel: UILabel!
    @IBOutlet weak var soptUserBarView: UIView!
    @IBOutlet weak var soptUserContentLabel: UILabel!
    
    
    func setSoptWorkingData(name: String, image: String, content: String) {
        self.soptUserImage.image = UIImage(named: image)
        self.soptUserNameLabel.text = name
        self.soptUserContentLabel.text = content
    }
}
