//
//  RuntimeVC.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/2/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "RuntimeVC.h"
#import <objc/runtime.h>

@interface RuntimeVC ()

@end

@implementation RuntimeVC

/*
 运行时机制
 1.一套纯C语言的接口，OC的底层实现。
 2.OC能够实现的功能都能实现，还能实现OC实现不了的功能。
 3.可以在程序运行期间动态的修改对象的属性和方法。
 4.可以进行方法交换，给类增加方法，增加属性。
 */

- (void)viewDidLoad {
    [super viewDidLoad];


}


@end
