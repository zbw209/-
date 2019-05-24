//
//  GCDController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/2/25.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "GCDController.h"
#import "OperationController.h"

@interface GCDController ()<GCDControllerDelegate>

{
    dispatch_group_t group;
    
}


@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) OperationController *operationVC;

@property (nonatomic, strong) dispatch_group_t a_group;
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation GCDController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test];
//    [self sync];
    [self queue1];
}

- (void)queue1 {
 
//    if (![NSThread isMainThread]) {
    
    NSLog(@"%s %d\n thread = %@",__func__,__LINE__,[NSThread currentThread]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%s %d\n thread = %@",__func__,__LINE__,[NSThread currentThread]);
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            sleep(2);
            NSLog(@"%s %d\n thread = %@",__func__,__LINE__,[NSThread currentThread]);
        });
        NSLog(@"%s %d\n thread = %@",__func__,__LINE__,[NSThread currentThread]);
    });
    NSLog(@"%s %d\n thread = %@",__func__,__LINE__,[NSThread currentThread]);

//    }
}

- (void)test {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        sleep(3);
        NSLog(@"%s %d\n",__func__,__LINE__);
        dispatch_group_leave(group);
    });
    
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%s %d\n",__func__,__LINE__);
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"%s %d\n",__func__,__LINE__);
    });
    
}

- (void)haha {
    NSLog(@"%s %d\n哈哈哈哈哈哈哈 self = %@",__func__,__LINE__,self);
}

- (void)sync {
    self.dataArr = [NSMutableArray new];
    group = dispatch_group_create();
    self.operationVC = [OperationController new];
    self.queue = dispatch_queue_create("串行队列", NULL);
    
    [self loadData:@"123" dalegate:self];
    
    dispatch_async(self.queue, ^{
        [self loadData:@"123" dalegate:self];

    });
    
//    [self loadData:@"abc" dalegate:self.operationVC];
//    [self loadData:@"zhoubiwen" dalegate:self];
//    [self loadData:@"676767" dalegate:self.operationVC];

    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"%s %d\n",__func__,__LINE__);
    });
    
//    [self loadData:@"545454" dalegate:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         NSLog(@"%s %d\n",__func__,__LINE__);
        [self loadData:@"23232323" dalegate:self.operationVC];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"%s %d\n",__func__,__LINE__);
    });

}



- (void)loadData:(NSString *)data dalegate:(id)delegate {
    
    [self.dataArr addObject:data];
    dispatch_group_enter(group);

//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//
//        if (!self.dataArr.count) {
//            NSLog(@"%s %d\n数据处理完成",__func__,__LINE__);
//            return;
//        }
//
//        NSString *str = self.dataArr.firstObject;
//        NSLog(@"%s %d\n开始处理数据 str = %@",__func__,__LINE__,str);
//
//        self.delegate = delegate;
//        for (int i = 0; i < str.length; i++) {
//            dispatch_group_enter(group);
//        }
//
//
        [self dealWithData:self.dataArr.firstObject];
//        [self.dataArr removeObjectAtIndex:0];
//
//    });

}


- (void)dealWithData:(NSString *)data {
    
    sleep(1);
    dispatch_group_leave(group);
    NSLog(@"%s %d\n",__func__,__LINE__);
//    for (int i = 0; i < data.length; i++) {
//        sleep(1);
//         NSLog(@"%s %d\ni = %d char = %c",__func__,__LINE__,i,[data characterAtIndex:i]);
//
//        [self.delegate haha];
//
//        dispatch_group_leave(group);
//    }

}

@end
