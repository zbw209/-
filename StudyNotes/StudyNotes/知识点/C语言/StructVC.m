//
//  StructVC.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/3/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "StructVC.h"

@interface StructVC ()

@end

@implementation StructVC

struct abc {
    int age;
    char *name;
    char sex;
} A;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    A.age = 10;
    A.name = "12345678";
    A.sex = 's';
    
    A.age = 10;
    
    struct abc stu;
    stu.age = 100;
    
}

/*
 结构体：用来存放不同数据类型的数据
 类似于OC中的对象
 
 */

@end
