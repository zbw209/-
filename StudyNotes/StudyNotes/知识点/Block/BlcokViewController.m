//
//  BlcokViewController.m
//  StudyNotes
//
//  Created by 周必稳 on 2017/6/5.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "BlcokViewController.h"

typedef void(^block)();

@interface BlcokViewController ()

@property (nonatomic, weak) block test1;

@end

@implementation BlcokViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 将该代码块存放在栈区，代码生命周期由系统控制。该代码块是一个局部变量，只会作用于viewDidLoad方法内，当该方法执行完毕后，会对该对象执行释放。在别处调用时已无法正常使用。
    
    block bl = ^(){
        NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    };

    _test1 = bl;
    
}

- (IBAction)buttonPressed:(id)sender {
    
    // select name from table yuangongbiao where salary > (select salary from table where id = '')
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
