//
//  AnimationTestVC.swift
//  27th_iOS_4Week_Seminar_Project
//
//  Created by 최영재 on 2020/11/07.
//

import UIKit

class AnimationTestVC: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpStart(_ sender: Any) {
//        UIView.animate(withDuration: 3.0, animations: {
//            self.ImageView.alpha = 0
//            self.ImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
//        }) { (finish) in
//            UIView.animate(withDuration: 1.0, animations: {
//                self.ImageView.alpha = 1
//                self.initPosition()
//            })
//        }
//
//
//    }
//
//    func initPosition() {
//        ImageView.frame = CGRect(x: 87, y: 210, width: 240, height: 209)
//    }
        let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let move = CGAffineTransform(translationX: 200, y: 300)
        let rotate = CGAffineTransform(rotationAngle: .pi/4)
        
        let combine = scale.concatenating(move).concatenating(rotate)
        UIView.animate(withDuration: 2.0, animations: {
            self.ImageView.transform = combine
        }) { finish in
            UIView.animate(withDuration: 1.0){
                self.ImageView.transform = .identity}
        }
        
    
    
}
}
