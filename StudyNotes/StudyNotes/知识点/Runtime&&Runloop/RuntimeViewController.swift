//
//  RuntimeViewController.swift
//  StudyNotes
//
//  Created by 周必稳 on 2017/2/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

import UIKit


class RuntimeViewController: UIViewController {

    var name :String?
    
    func method1() -> Void {
        
    }
    func method2() -> Void {
        
    }
    func method3() -> Void {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("111111111")
        var methodListCount : UInt32 = 0
       let methodList = class_copyMethodList(NSClassFromString("RuntimeViewController"), &methodListCount)
        
        print("methodListCount = \(methodListCount)")
        
//        for index in 0..<numericCast(methodListCount) {
//            print("methodName is \(method_getName(methodList?[index]))")
//        }
    }
}
