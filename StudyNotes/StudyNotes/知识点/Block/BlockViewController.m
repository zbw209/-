//
//  BlcokViewController.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/6/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "BlockViewController.h"
//#import <ReactiveObjC.h>
//#import "UIImageView+WebCache.h"


#define metamacro_concat_(A, B) A ## B

@interface BlockViewController ()

@property (nonatomic, strong) void(^block)(void);
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIView *testV;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//     NSAllocateMemoryPages(221886600000);
//    return;
    // 将该代码块存放在栈区，代码生命周期由系统控制。该代码块是一个局部变量，只会作用于viewDidLoad方法内，当该方法执行完毕后，会对该对象执行释放。在别处调用时已无法正常使用。

    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setValue:@"123" forKey:@"123"];
    
//    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
//    imageV.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageV];
    
//    [imageV sd_setImageWithURL:[NSURL URLWithString:@"http://testhead.makezixun.com/news/picture/20181105/43a9bff732354a7d66a2f9f5d57c6c5e.gif"]];
    
    [self testCycleReference];
}

- (void)dealloc {
    NSLog(@"%s%d\n",__func__,__LINE__);
}

- (void)createBlock {
    void(^blockNoArgs)(void) = ^{
        NSLog(@"%s%d\n",__func__,__LINE__);
        NSLog(@"block：无参无返回值");
    };

    void(^blockHasArgs)(NSString *) = ^(NSString *args){
        NSLog(@"block：有参无返回值 返回值：%@",args);
    };
    NSString *(^blockHasArgsAndReturnValue)(NSString *) = ^(NSString *args){
        return [NSString stringWithFormat:@"block：有参无有返回值 参数：%@",args];
    };

    NSString *str = @"111";
    __block UIView *view = [UIView new];
   
    NSString *(^block)(NSString *) = ^(NSString *arggs){
//        retainStr = @"223";
        view = [UIView new];
//        str = @"222";
        NSLog(@"self = %@",self);
        return [NSString stringWithFormat:@"block：有参无有返回值 str：%@",str];
    };

    block(@"333");
    blockNoArgs();
    blockHasArgs(@"入参");
    NSString *returnValue = blockHasArgsAndReturnValue(@"入参");
    NSLog(@"returnValue = %@",returnValue);
}

- (IBAction)buttonPressed:(id)sender {
    BlockViewController *vc = [UIStoryboard storyboardWithName:@"Block" bundle:nil].instantiateInitialViewController;
    
    CFIndex viewCount = CFGetRetainCount((__bridge CFTypeRef)vc);
    NSLog(@"%s%d\nviewCount = %ld",__func__,__LINE__,viewCount);

    [self showViewController:vc sender:nil];
}

- (IBAction)startBtnPressed:(id)sender {
    [self test2];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (void)test2 {

    __weak __typeof__(self) self_weak = self;
    CFIndex viewCount = CFGetRetainCount((__bridge CFTypeRef)self);
    NSLog(@"%s%d\nviewCount = %ld",__func__,__LINE__,viewCount);

//    @weakify(self);
    
    void(^haha)(void) = ^{
//        __strong __typeof__(self) self = self_weak;
//        @strongify(self);
//        NSLog(@"%s%d\n_name = %@",__func__,__LINE__,self->_name);
//        NSLog(@"%s%d\nself = %@",__func__,__LINE__,self_weak);
//        NSLog(@"%s%d\nself = %@",__func__,__LINE__,self);

    };
    
    // block内部使用到外部的变量时，为确保变量安全使用可采取两种方法避免变量使用异常。1.对引用变量做非空判断 2.确保引用变量持有关系均为强持有（确保block执行时截获发变量不会被销毁）
    self.block = ^{
        
//
//        NSLog(@"%s%d\nself = %@",__func__,__LINE__,self_weak);
        
        NSLog(@"123123");
    };
    
        
    CFIndex viewCount1 = CFGetRetainCount((__bridge CFTypeRef)self);
    NSLog(@"%s%d\nviewCount = %ld",__func__,__LINE__,viewCount1);
    self.block();
    

}

/*block导致的循环引用问题*/
- (void)testCycleReference {
    // 对象互相持有，导致内存引用计数无法变为0所以无法执行释放流程
    
//    UIView *view = [UIView new];
//
//    CFIndex viewCount = CFGetRetainCount((__bridge CFTypeRef)view);
//    NSLog(@"%s%d\nviewCount = %ld",__func__,__LINE__,viewCount);
//
//    NSArray *arr = @[self];
//
//    CFIndex count = CFGetRetainCount((__bridge CFTypeRef)self);
//
//    NSLog(@"%s%d\ncount = %ld",__func__,__LINE__,count);
    
//    __strong NSInteger index = 18;

//    void(^globalBlock)(void) = ^{
//        NSLog(@"%s%d\n",__func__,__LINE__);
//        CFIndex count = CFGetRetainCount((__bridge CFTypeRef)self);
//        NSLog(@"%s%d\ncount = %ld",__func__,__LINE__,count);
//    };
//
//    void(^mallocBlock)(void) = ^{
//        NSLog(@"%s%d\nindex = %ld",__func__,__LINE__,metamacro_concat_(ind, ex));
//    };

    typeof(self) wws = self;
    
//    NSLog(@"%s%d\n wws = %p val = %@",__func__,__LINE__,wws,wws);
//    NSLog(@"%s%d\n add = %p val = %@",__func__,__LINE__,self,self);
    
    // 创建一个弱引用self的临时变量
//    weakify(self);
//
        __weak __typeof__(self) self_weak = (self);
//
//    #define rac_strongify_(INDEX, VAR) \
//        __strong __typeof__(VAR) VAR = metamacro_concat(VAR, _weak_);

    self.block = ^{
        __strong __typeof__(self) self = self_weak;

        // self指针重指向外部创建的临时变量并强引用
//        @strongify(self);
        
//        NSLog(@"%s%d\n add = %p val = %@",__func__,__LINE__,self,self);
        //        __strong typeof(self) self_strong_ = self;
        
        
        
    };
    
//    globalBlock();
    self.block();
//    NSLog(@"%s%d\nglobalBlock = %@",__func__,__LINE__,globalBlock);
//    NSLog(@"%s%d\nmallocBlock = %@",__func__,__LINE__,mallocBlock);
//    NSLog(@"%s%d\nblock = %@",__func__,__LINE__,self.block);

}


@end
