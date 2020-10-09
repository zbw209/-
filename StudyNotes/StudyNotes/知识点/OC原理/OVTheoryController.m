//
//  OVTheoryController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2020/3/23.
//  Copyright © 2020 zhou. All rights reserved.
//

#import "OVTheoryController.h"
#import <objc/runtime.h>

#import <multi-project/Multi-project.h>
#import <multi-project/Multi-project.m>

@interface OVTheoryController ()

@end

@implementation OVTheoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Multi_project saySomething];
//    [self doSomeThing];
}


#pragma mark - 动态方法解析
/*
 动态方法解析，方法首次调用时会在对象/类所在的类/元类的方法列表中查找对应的方法，若不存在则会执行resolveInstanceMethod:/resolveClassMethod：
 */
+ (BOOL)resolveClassMethod:(SEL)sel {
    
    BOOL result = [super resolveClassMethod:sel];
    
    return result;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    Method me = class_getInstanceMethod(self, sel);
    
    if (me) {
        NSLog(@"%s%d\n",__func__,__LINE__);
    }else {
        NSLog(@"%s%d\n",__func__,__LINE__);
    }
    
    IMP imple = method_getImplementation(me);
    
    if (imple) {
        NSLog(@"%s%d\n",__func__,__LINE__);
    }else {
        NSLog(@"%s%d\n",__func__,__LINE__);
    }
    BOOL result = [super resolveInstanceMethod:sel];
    return result;
}

#pragma mark - 消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [super methodSignatureForSelector:aSelector];
}

#pragma mark - NSInvocation&&NSMethodSignature
/*
 NSInvocation
 an objective-C message rednered as an object.（一个呈现OC方法的对象）
 
 NSMethodSignature
 记录一个方法返回值和参数类型信息
 */

@end
