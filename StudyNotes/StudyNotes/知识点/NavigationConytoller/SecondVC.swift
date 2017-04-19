//
//  SecondVC.swift
//  StudyNotes
//
//  Created by 周必稳 on 2017/4/19.
//  Copyright © 2017年 zhou. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\((#file).components(separatedBy: "/").last!) \(#line) \(#function) \(self.navigationController)")
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.init(named: "icon_back_normal")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.init(named: "icon_back_normal")
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "1", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = UIColor.red
        label.text = "测试"
        label.sizeToFit()
        
        let barButtonItem = UIBarButtonItem.init(customView: label)
        self.navigationItem.leftBarButtonItem = barButtonItem
        self.navigationItem.leftItemsSupplementBackButton = true
        
        
        self.navigationController?.delegate = self
    }
}

extension SecondVC : UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
}
