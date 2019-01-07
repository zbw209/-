//
//  BlcokViewController.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/6/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "BlcokViewController.h"

#import "UIImageView+WebCache.h"

@interface BlcokViewController ()


@end

@implementation BlcokViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 将该代码块存放在栈区，代码生命周期由系统控制。该代码块是一个局部变量，只会作用于viewDidLoad方法内，当该方法执行完毕后，会对该对象执行释放。在别处调用时已无法正常使用。

    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setValue:@"123" forKey:@"123"];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    imageV.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageV];
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:@"http://testhead.makezixun.com/news/picture/20181105/43a9bff732354a7d66a2f9f5d57c6c5e.gif"]];
    
    
}

- (IBAction)buttonPressed:(id)sender {
    
}



@end
