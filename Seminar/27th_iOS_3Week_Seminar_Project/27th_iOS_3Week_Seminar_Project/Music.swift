//
//  Music.swift
//  27th_iOS_3Week_Seminar_Project
//
//  Created by 최영재 on 2020/10/31.
//

import Foundation
import UIKit
struct Music {
    var title: String
    var singer: String
    var albumImageName: String
    func makeAlbumImage() -> UIImage? {
        return UIImage(named: albumImageName)
    }
}
