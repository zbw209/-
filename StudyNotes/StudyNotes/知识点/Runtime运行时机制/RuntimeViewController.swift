//
//  RuntimeViewController.swift
//  StudyNotes
//
//  Created by 周必稳 on 2017/2/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

import UIKit


class RuntimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        var methodListCount : UInt32 = 0
       let methodList = class_copyMethodList(NSClassFromString("RuntimeViewController"), &methodListCount)

        for index in 0..<numericCast(methodListCount) {
        
        }
    }


}
