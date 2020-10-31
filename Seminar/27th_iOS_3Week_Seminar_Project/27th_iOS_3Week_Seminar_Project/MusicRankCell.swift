//
//  MusicRankCell.swift
//  27th_iOS_3Week_Seminar_Project
//
//  Created by 최영재 on 2020/10/31.
//

import UIKit

class MusicRankCell: UITableViewCell {
    static let identifier = "MusicRankCell"
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(rank: Int, music: Music) {
        albumImageView.image = music.makeAlbumImage()
        rankLabel.text = "\(rank + 1)"
        titleLabel.text = music.title
        singerLabel.text = music.singer
    }
    
}
