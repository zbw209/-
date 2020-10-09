//
//  AlamofireViewController.swift
//  StudyNotes
//
//  Created by zhoubiwen on 2020/5/25.
//  Copyright © 2020 zhou. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        AF.request("https://httpbin.org/get", requestModifier: { $0.timeoutInterval = 5 })
        AF.request("",method: .post).response { (response) in
            
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
