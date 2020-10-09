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

    struct Student<T> {
        
        var name : String = "哈哈哈"
        var age : NSInteger = 12
        var score : Int = 98
        var aaa : T
        
        func getScore(score : NSInteger) {

        }
    }
    
    func test() {
        
        var stu = Student<String>(aaa: "123");
        
        
        
    }
    
}

/*
 参考资料：
 1.关键词、系统协议、高阶函数、专业概念
 https://juejin.im/post/5eb8186bf265da7b95055d4d
 
 
 */
/*
 swift数据结构：class、struct、enum
 组件关系：inheritance、protocols、generics
 方法分派方式：static dispatch、dynamic dispatch
 
 性能优化维度：内存分配（堆、栈）、引用计数、方法派发机制
 
 内存分配可分为堆栈分配，栈分配要比堆分配的快（栈分配的是连续的内存空间）。创建的类会分配在堆区，创建的结构体会分配在栈区。
 
 
 */

//MARK:- 范式
extension SwiftProgramViewController {

    // 像是多态，父类指针指向子类对象
    /*
     
     
     */
}

//MARK:- 高阶函数

extension SwiftProgramViewController {
    
    func advancedFunction() {
        let numbers = [1,2,3,4,5]
        
        // filter 根据闭包设置条件过滤数组元素
        let odd = numbers.filter{(number) -> Bool in
            return number % 2 == 1
        }
        let odd1 = numbers.filter({$0 % 2 == 1})
        
        print(odd)
        
        // map 对数组中的元素进行格式转换
        let mapResult = numbers.map{(number) -> String in
            return "\(number)"
        }
//        let mapResult2 = numbers.map({"\($0)"})
        print(mapResult)
        
        // reduce 累计运算
//        let reduce1 = numbers.reduce(0,+)
//        let reduce2 = numbers.reduce(0){$0+$1}
//        let reduce3 = numbers.reduce(0, {(result , number) in
//            return result + number
//        })
        
    }
}
