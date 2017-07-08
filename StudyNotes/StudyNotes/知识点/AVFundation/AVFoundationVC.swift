//
//  AVFoundationVC.swift
//  StudyNotes
//
//  Created by 周必稳 on 2017/5/12.
//  Copyright © 2017年 zhou. All rights reserved.
//

import UIKit
import AVFoundation

class AVFoundationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    func setupSubViews() {
            let shapeLayer = CAShapeLayer()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.addLine(to: CGPoint(x: 50, y: 150))
        path.addLine(to: CGPoint(x: 50, y: 50))
        
        shapeLayer.frame = self.view.bounds
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        
        self.view.layer.addSublayer(shapeLayer)
    }
    
    
    func readBook() -> Int {
        return 1
    }

}
