//
//  SecondVC.swift
//  StudyNotes
//
//  Created by 周必稳 on 2017/4/19.
//  Copyright © 2017年 zhou. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var abc : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\((#file).components(separatedBy: "/").last!) \(#line) \(#function) \(String(describing: self.navigationController))")
        var image = UIImage.init(named: "icon_back_normal")
        image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //       image?.renderingMode = UIImageRenderingMode.alwaysOriginal
        
        self.navigationController?.navigationBar.backIndicatorImage = image
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        

        //        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "1", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
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



