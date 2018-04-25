//
//  MacroVC.m
//  StudyNotes
//
//  Created by zhoubiwen on 2018/4/24.
//  Copyright © 2018年 zhou. All rights reserved.
//

#import "MacroVC.h"

@interface MacroVC ()

@end

@implementation MacroVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self perforemSelector:@selector(name:age:) args:@"小刚",@"17", nil];
    
    [self perforemSelector:@selector(lover:) args:@"Dreamer", nil];
    
    NSString *str = [self perforemSelector:@selector(life) args:nil];
    
    NSLog(@"%s %d\nstr = %@",__func__,__LINE__,str);
}

/*
 C语言中一些宏定义的含义以及使用
 */


/*
 方法名中同一个变量加...的多参数语法，eg：NSLog(@"");
 
 内部实现的原理：
 1.通过两种方法获取传入参数的数量
 1.1 NS_FORMAT_FUNCTION(1,2)
 多参数的第一个参数为格式化参数，可以通过第一个参数确定传入参数的总数
 
 1.2 NS_REQUIRES_NIL_TERMINATION
 多个参数结尾要添加nil，通过nil确定参数总数
 
 2.通过va_arg(ap,type)获取每个参数
 
 
 */

- (void)formatLog:(NSString *)string,... NS_FORMAT_FUNCTION(1,2) {
    va_list args;
    NSString *arg;
    
    va_start(args, string);
    while ((arg = va_arg(args, NSString *))) {
        arg = [arg stringByAppendingString:arg];
    }
    va_end(args);
    
    printf("%s",[arg UTF8String]);
}

- (void)argsHaveNilLog:(NSString *)string,... NS_REQUIRES_NIL_TERMINATION {
    

}

- (void)name:(NSString *)name age:(NSString *)age {
     NSLog(@"%s %d\nname = %@  age = %@",__func__,__LINE__,name,age);
}

- (void)lover:(NSString *)lover {
     NSLog(@"%s %d\nlover = %@",__func__,__LINE__,lover);
}

- (NSString *)life {
    return @"生命就像一条大河";
}

// 处理需要传递多个参数的方法
- (id)perforemSelector:(SEL)selector args:(id)arg,... NS_REQUIRES_NIL_TERMINATION {
    
    // 实例方法
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    
    if (!signature) {
        signature = [self methodSignatureForSelector:selector];
        if (!signature) return nil;
    }

    // 有了方法名和返回值类型 ，但是没有参数列表
    
    /*
     invocation使用
     1.方法对应的MethodSignature对象
     2.设置target
     3.设置selector
     4.设置参数setArgument
     5.设置返回值returnValue
     */
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    // 参数个数为2时，表示方法没有入参（targer、selector为前两个参数）
    if (signature.numberOfArguments > 2) {
        // 设置参数列表 获取index
        va_list args;
        id parameter;
        
        va_start(args, arg);
        
        [invocation setArgument:&arg atIndex:2];
        
        int i = 3;
        while ((parameter = va_arg(args, id))) {
            [invocation setArgument:&parameter atIndex:i++];
        }
        va_end(args);
    }
    
    [invocation invoke];
    
    id returnValue = nil;
    
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    return returnValue;
}





@end
