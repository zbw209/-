//
//  YYTextController.m
//  StudyNotes
//
//  Created by zhoubiwen on 2019/2/28.
//  Copyright © 2019 zhou. All rights reserved.
//

#import "YYTextController.h"
#import <YYText.h>

@interface YYTextController ()

@end

@implementation YYTextController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test {
    
    YYLabel *label = [[YYLabel alloc]initWithFrame:CGRectMake(50, 100, 200, 100)];
    label.backgroundColor = [UIColor purpleColor];
    label.numberOfLines = 0;
//    label.text = @"哈哈哈哈\n 切尔奇二冯危房趣问任务";
    label.textColor = [UIColor whiteColor];
    
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:@"哈哈哈哈 切尔奇二冯危房趣问任务"];
    [attriStr addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} range:NSMakeRange(0, 4)];
    label.attributedText = attriStr;
    
    label.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        
//        NSLog(@"%s %d\ncontainerView = %@",__func__,__LINE__,containerView);
//        NSLog(@"%s %d\ntext = %@",__func__,__LINE__,text);
//        NSLog(@"%s %d\nrange = %@",__func__,__LINE__,NSStringFromRange(range));
//        NSLog(@"%s %d\nrect = %@",__func__,__LINE__,NSStringFromCGRect(rect));
        
        if (range.location >= 0 && range.location <= 3) {
             NSLog(@"%s %d\n",__func__,__LINE__);
        }
    };
    
    [self.view addSubview:label];
    
    
    
}


@end

