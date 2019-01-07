//
//  PullDownView.h
//  文件编译
//
//  Created by 周必稳 on 2017/4/25.
//  Copyright © 2017年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    TriangleViewLeftTop,
    TriangleViewCenterTop,
    TriangleViewRightTop,
} PullDownViewTriangleViewDirection;

@protocol PullDownViewDelegate <NSObject>

@optional
- (void)cellDidSelectAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface PullDownView : UIView

@property (nonatomic, assign) BOOL enableBounces;

+ (instancetype)pullDownViewWithFrame:(CGRect)frame; 

- (void)showAnimation;

- (void)setPullDownViewDelegate:(id<PullDownViewDelegate>)delegate;

- (void)setTriangleDirection:(PullDownViewTriangleViewDirection)direction;

@end
