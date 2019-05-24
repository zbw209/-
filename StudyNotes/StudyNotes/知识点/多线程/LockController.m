//
//  LockController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/3/22.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "LockController.h"

@interface LockController ()

@end

@implementation LockController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self lock];
    
}

- (void)lock {
    
    
    for (int i = 0; i < 10; i++) {
    
//        dispatch_queue_t queue = dispatch_queue_create("", <#dispatch_queue_attr_t  _Nullable attr#>)
//        dispatch_async(, <#^(void)block#>)
        
    }
    
    
}


- (void)test {
     NSLog(@"%s %d\n",__func__,__LINE__,[NSThread currentThread]);
}


@end
