//
//  RunLoopVC.m
//  StudyNotes
//
//  Created by zhoubiwen on 2018/8/6.
//  Copyright © 2018年 zhou. All rights reserved.
//

#import "RunLoopVC.h"
#import "ZThread.h"

@interface RunLoopVC ()<UIScrollViewDelegate>

@property (nonatomic, strong) ZThread *thread;

@end

@implementation RunLoopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self performSelector:@selector(test2) onThread:self.thread withObject:nil waitUntilDone:NO];
    NSLog(@"%s %d\n",__func__,__LINE__);
    
}

- (void)test1 {
    self.thread = [[ZThread alloc] initWithBlock:^{
        NSLog(@"菩提本无树 明镜亦非台");
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSPort port] forMode:NSRunLoopCommonModes];
        
        [runloop run];
        /*下面代码之所以不走，是因为runloop在执行了run方面后会开始管理线程需要执行的任务。
         run 方法内部 已经开始事件循环了，应该是只能接受input sources和timer 事件了
         */
        
        //        NSPort *port = [NSPort port];
        //        NSLog(@"%s %d\n port = %@",__func__,__LINE__,port);
        
        NSLog(@"%s %d\n runloop = %@",__func__,__LINE__,runloop);
        NSLog(@"%s %d\n mode = %@",__func__,__LINE__,runloop.currentMode);
        
    }];
    
    [self.thread start];
}

- (void)test2 {
    NSThread *thred = [NSThread currentThread];
    
    NSLog(@"%s %d\n thred = %@",__func__,__LINE__,thred);
    
    NSLog(@"%s %d\n %@",__func__,__LINE__,[[NSRunLoop currentRunLoop] currentMode]);
    
    NSLog(@"线程即将执行任务");
    sleep(2);
    NSLog(@"线程执行任务完毕");
    
}

- (void)principleOfRunloop {
    
    BOOL loop = YES;
    do {
        
        
    } while (loop);
}

- (void)scrollViewMode {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
}


/**
 定时器加入runloop时，设置不同的模式的效果
 */
- (void)setupTimer {
    __block NSInteger index = 0;
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%s %d\n 大家好 index = %ld",__func__,__LINE__,index);
        index++;
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

#pragma mark - 添加runloop观察者
- (void)registRunLoopObserver {
    
    CFRunLoopRef runloop = [[NSRunLoop currentRunLoop] getCFRunLoop];
    
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, 1, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"%s %d进入",__func__,__LINE__);
                NSLog(@"%s %d\n thread = %@",__func__,__LINE__,[NSThread currentThread]);
                NSLog(@"currentMode = %@",[NSRunLoop currentRunLoop].currentMode);
                break;
            case kCFRunLoopAfterWaiting:
                
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"%s %d休眠",__func__,__LINE__);
                NSLog(@"%s %d\n thread = %@",__func__,__LINE__,[NSThread currentThread]);
                NSLog(@"currentMode = %@",[NSRunLoop currentRunLoop].currentMode);
                break;
                
            default:
                break;
        }
    });
    
    //    NSRunLoopMode mode = UITrackingRunLoopMode;
    
    CFRunLoopAddObserver(runloop, observer,(__bridge CFStringRef)UITrackingRunLoopMode);
    
    [[NSRunLoop currentRunLoop] addObserver:self forKeyPath:@"currentMode" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    NSLog(@"%s %d\n currentMode = %@",__func__,__LINE__,[NSRunLoop currentRunLoop].currentMode);
}

/*
 runloopMode三个职能
 1.一个输入来源的集合
 2.能够被监控的定时器
 3.能够接受通知的runloop观察者
 */

/*
 input sources
 能够向线程提交事件。事件源依赖于输入源的类型（一般就是两个分类中的一个）。输入源的分类有基于硬件端口的和自定义的。基于端口的监控你的应用硬件端口发送的事件。自定义的监控你自定义的事件源。
 
 */
/*
 定时器
 在未来预定时间时提交同步时间给你的线程
 执行时若当前线程在执行，则跳过该次任务
 
 */
/*
 runloop observer
 可以接收当线程状态切换时的通知
 
 */

@end
