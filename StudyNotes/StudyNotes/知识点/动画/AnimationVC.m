//
//  AnimationVC.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/2/14.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "AnimationVC.h"

@interface AnimationVC ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation AnimationVC


/*
 动画一般使用的就是两种：CA动画和CG动画
 CA动画用于对视图做一些动画效果
 CG动画用于绘制图层
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawTriangle];
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
//        self.testView.layer.affineTransform = CGAffineTransformMakeScale(2.0, 1.0);

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
