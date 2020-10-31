//
//  MusicInfoVC.swift
//  27th_iOS_3Week_Seminar_Project
//
//  Created by 최영재 on 2020/10/31.
//

import UIKit

class MusicInfoVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicInfo()
        
    }
    
    
    func setMusicInfo() {
        if let music = music {
            titleLabel.text = music.title
            singerLabel.text = music.singer
            albumImageView.image = music.makeAlbumImage()
        }
    }
    
}
