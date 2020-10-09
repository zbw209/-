//
//  CrashViewController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2020/5/25.
//  Copyright © 2020 zhou. All rights reserved.
//

#import "CrashViewController.h"

@interface CrashViewController ()

@end

@implementation CrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - 崩溃堆栈信息采集
/*
 参考资料：https://www.jianshu.com/p/d26b29f58d64
 1.通过监听系统信号的方式实现，程序崩溃时系统会发送异常信号，开发者可以通过监听异常信号并设置回调处理函数的方式记录崩溃堆栈信息
 2.使用NSUncaughtExceptionHandler捕获NSEXception
 */
/*
 static int Beacon_errorSignals[] = {
     SIGABRT,
     SIGBUS,
     SIGFPE,
     SIGILL,
     SIGSEGV,
     SIGTRAP,
     SIGTERM,
     SIGKILL,
 };
 */

void crashSignalCallBack(int type) {
    
}

- (void)notiCrashSignal {
    
    for (int i = 0; i < 8; i++) {
        signal(i, &crashSignalCallBack);
    }
    
}


#pragma mark - 崩溃拦截


@end
