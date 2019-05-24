//
//  OperationController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/2/25.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "OperationController.h"

@interface OperationController ()

@end

@implementation OperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test1];
}


- (void)test1 {
    NSOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%s %d\n currentThred = %@",__func__,__LINE__,[NSThread currentThread]);
//        NSLog(@"%s %d\n op.isFinished = %d",__func__,__LINE__,op.isFinished);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%s %d\n op.isFinished = %d",__func__,__LINE__,op.isFinished);
        });
    }];
    
    NSOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%s %d\n op.isFinished = %d",__func__,__LINE__,op.isFinished);

        NSLog(@"%s %d\n currentThred = %@",__func__,__LINE__,[NSThread currentThread]);
    }];
    
    
    [op1 addDependency:op];
    
//    NSLog(@"%s %d\n op.isFinished = %d",__func__,__LINE__,op.isFinished);
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    for (int i = 0; i < 10; i++) {
        NSOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%s %d\n currentThred = %@",__func__,__LINE__,[NSThread currentThread]);
        }];
        [queue addOperation:op];
    }
    
    [queue addOperation:op];
    [queue addOperation:op1];

//    NSLog(@"%s %d\n op.isFinished = %d",__func__,__LINE__,op.isFinished);

    
}

- (void)haha {
    NSLog(@"%s %d\n赫尔呵呵呵呵呵呵呵额呵呵 sele = %@",__func__,__LINE__,self);
}

@end
