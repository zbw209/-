//
//  RACViewController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/2/18.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "RACViewController.h"

#import <ReactiveObjC.h>

@interface RACViewController ()

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test];
//    [self commandTest];
    [self signalOperationTest];
}

- (void)test {
    
     // 创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        // 发布信号
        [subscriber sendNext:@"你们好啊 小兄弟"];
        [subscriber sendNext:@"你们好啊 小兄弟"];

        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
    // 订阅信号
    [signal subscribeNext:^(id  _Nullable x) {
         NSLog(@"%s %d\nx = %@",__func__,__LINE__,x);
    }];
}

- (void)commandTest {
    NSLog(@"%s %d\n",__func__,__LINE__);
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        NSLog(@"%s %d\ninput = %@",__func__,__LINE__,input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"%s %d\n",__func__,__LINE__);
            [subscriber sendNext:@"发布信号"];
            [subscriber sendError:nil];
            [subscriber sendCompleted];
            
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }];
    
    /*
     命令需要执行才会走创建时设置好的block，创建时的block返回的信号对象不能为空。
     创建信号时，需要在block里设置信号订阅者操作，这样在信号才会走接收的block回调。
     
     1.命令执行
     2.调用创建命令时设置的signalblock
     3.拿到创建时的信号
     4.进行信号订阅（订阅者会在信号订阅时创建，subscribeNext此方法为订阅信号方法）
     5.订阅者调用sendNext会回调subscribeNext：方法设置的block
     
     */
    
    [command.executionSignals subscribeNext:^(id  _Nullable x) {
        NSLog(@"%s %d\n接收数据  --- x = %@",__func__,__LINE__,x);
    }];
    
    RACSignal *signal = [command execute:@"123123123"];
     NSLog(@"%s %d\nsignal = %@",__func__,__LINE__,signal);
    
    
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%s %d\n接收数据  --- x = %@",__func__,__LINE__,x);
    }];
    
    
}

- (void)signalOperationTest {
    
    RACSubject *subject = [RACSubject subject];
    
    RACSubject *signal = [RACSubject subject];
    
    [[subject take:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%s %d\n突突突突突突突突 --- x = %@",__func__,__LINE__,x);
    }];
    
    [[subject takeLast:1] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%s %d\ndudududuud --- x = %@",__func__,__LINE__,x);
    }];
    
    [[subject takeUntil:signal] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%s %d\nhhahahaha --- x = %@",__func__,__LINE__,x);
    }];
    
    [subject sendNext:@"你"];
    [subject sendNext:@"在"];
    [subject sendNext:@"干"];
    
    [subject sendCompleted];
    
    [subject sendNext:@"什"];
    [subject sendNext:@"么"];
    [subject sendNext:@"呢"];
    [subject sendNext:@"？"];
    [signal sendNext:@"好想你"];
}


@end
