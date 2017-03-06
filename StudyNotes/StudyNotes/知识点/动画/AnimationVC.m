//
//  AnimationVC.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/2/14.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AnimationVC.h"
#import "AnimationView.h"

@interface AnimationVC ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation AnimationVC


/*
 动画一般使用的就是两种：CA动画和CG动画
 CA动画用于对视图做一些动画效果
 CG动画用于绘制图层
 
 */

/*
 CoreGraphicsAPI的所有操作都需要在一个上下文中执行。所以在绘图之前需要获取该上下文并传入执行渲染的函数。
 
 
 drawRect 方法
 这个方法的默认不会执行任何操作。
 需要使用CoreGraphics和UIKit技术绘制视图内容的子类应该重写这个方法，并且实现方法。如果你的视图使用别的方式去设置它的内容就不要重写这个方法。例如，如果你的视图只是展示背景色或者是使用潜在的layer直接设置内容，这些都不需要重写这个方法。
 当这个方法被调用的时候，UIKit已经把view的图形绘制环境配置好了，你只用调用渲染图形内容的绘制方法和函数。特别的，UIKit为绘制创建并且配置了一个图形上下文，调整内容的转换以便图形上下文的原点匹配你的视图矩形范围的原点。你可以使用UIGraphicsGetCurrentContext函数获得一个图形上下文的引用（获取当前图形上下文对象），但是不要对图形上下文建立一个强引用因为在drawRect方法调用的时候他会改变。
不需要手动调用，会在视图第一次加载的时候调用，后续的话视图调用setNeedDisplay方法的调用
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self coreGraphicsTest];
//    [self drawTriangle];

}

- (void)coreGraphicsTest {
    /* 图形上下文类 获取当前绘制图形的环境，就是与该图形相关的参数，保存绘图的信息，决定图片的输出
     需要跟view关联，才能将图片在view上显示
     
     CGContextRef 创建方式
     1.在UIView的drawRect方法中获取当前图形上下文
     2.使用bitmap函数创建
     3.使用PDF函数创建
     */
    AnimationView *view = [[AnimationView alloc]initWithFrame:CGRectMake(50, 50, 80, 80)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

}

// 绘制三角形,使用CA动画
- (void)drawTriangle {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:(CGPoint){self.view.frame.size.width / 2, 50}];
    [path addLineToPoint:CGPointMake(self.view.frame.size.width / 2, 120)];
    [path addLineToPoint:CGPointMake(self.view.frame.size.width / 2 + 80, 120)];
    [path addLineToPoint:(CGPoint){self.view.frame.size.width / 2, 50}];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.view.bounds;
    layer.path = path.CGPath;
    layer.cornerRadius = 2.0;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor yellowColor].CGColor;
    
    [self.view.layer addSublayer:layer];

    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@""];
}

- (IBAction)bottomButtonPressed:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        CGRect frame = self.testView.frame;
        frame.size.width *= 4;
        self.testView.frame = frame;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:2 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            CGRect frame = self.testView.frame;
            frame.size.width /= 4;
            self.testView.frame = frame;
        } completion:nil];
    }];
}

@end
