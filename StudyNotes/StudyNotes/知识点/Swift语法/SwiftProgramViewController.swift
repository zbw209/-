//
//  SwiftProgramViewController.swift
//  StudyNotes
//
//  Created by 周必稳 on 2017/3/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

import UIKit

class SwiftProgramViewController: UIViewController {

    
     var abc = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


//MARK:- 范式
extension SwiftProgramViewController {

    // 像是多态，父类指针指向子类对象
    /*
     
     
     */
}

class Person : NSObject {

    func growup() {
    
        let vc = SwiftProgramViewController()
    }
    
}


