//
//  ImageDrawController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/3/4.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "ImageDrawController.h"
#import "AsyncView.h"

#import <ReactiveObjC/ReactiveObjC.h>

@interface ImageDrawController ()

@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UIImageView *testImageView;
@end

@implementation ImageDrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createAsyncView];
 
    [self loadWebPIamge];
}

- (void)loadWebPIamge {
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://image.makezixun.com/forum/thumb/20190409/d5e97a1e778b7c085be22fd57a5ee889.webp"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        
    }];
    
    [task resume];
    
}

- (void)createTestView {
    self.testImageView = [UIImageView new];
    self.testImageView.backgroundColor = [UIColor purpleColor];
    self.testImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.testImageView.frame = CGRectMake(0, 0, 200, 180);
    //    self.testView.image = [UIImage imageNamed:@"image2.jpg"];
    self.testImageView.center = self.view.center;
    [self.view addSubview:self.testImageView];
    
    self.testView = [UIView new];
    self.testView.backgroundColor = [UIColor cyanColor];
    self.testView.frame = CGRectMake(50, 50, 100, 100);
    [self.view addSubview:self.testView];
    
    [self byCreateLayer:self.testView cornerRadius:20];
    [self byCreateLayer:self.testImageView cornerRadius:30];
    //    [self drawCornerRadiusByBezierPathAndCG];

}

- (void)createAsyncView {
    
   __block AsyncView *view = [AsyncView new];
    view.frame = CGRectMake(50, 100, 100, 100);
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    
    [RACObserve(view.layer, contents) subscribeNext:^(id  _Nullable x) {
    
        
        
    }];
    
    
//    [view.layer setNeedsDisplay];
    
//    view.text = @"123123";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 300, 80, 80);
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [view.layer setNeedsDisplay];
    }];
    
//    [view setNeedsDisplay];

}

// 使用内塞尔曲线和CG框架画圆角(切的是图片)
- (void)drawCornerRadiusByBezierPathAndCG {
    
    // 配置绘制环境
    UIGraphicsBeginImageContextWithOptions(self.testView.bounds.size, NO, 1.0);
    
    [[UIBezierPath bezierPathWithRoundedRect:self.testView.bounds cornerRadius:20] addClip];
    
    [self.testImageView drawRect:self.testImageView.bounds];
    
    self.testImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
}


- (void)byCreateLayer:(UIView *)view cornerRadius:(CGFloat)cornerRadius {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = view.bounds;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    layer.path = path.CGPath;
    view.layer.mask = layer;
}





@end
