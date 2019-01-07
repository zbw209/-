//
//  OptimizeTableViewCellAnimateVC.swift
//  StudyNotes
//
//  Created by zhoubiwen on 2018/11/6.
//  Copyright © 2018年 zhou. All rights reserved.
//

import UIKit

class OptimizeTableViewCellAnimateVC: UIViewController {

    var tableView : UITableView?
    var arr : Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupTableView()
        
        arr?.append("123")
        arr?.append("123")
        arr?.append("123")
        arr?.append("123")
        arr?.append("123")
        
        
    }
    
}

extension OptimizeTableViewCellAnimateVC {
    
    func setupTableView() {
        self.tableView = UITableView()
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableView?.frame = CGRect(origin: CGPoint.zero, size: self.view.bounds.size)
        self.view.addSubview(self.tableView!)
    }

    func insertEvent() {
        
        
        
    }
    
}

extension OptimizeTableViewCellAnimateVC : UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "indexPath = \(indexPath)"
        return cell
    }
    
}
